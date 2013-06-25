#!/usr/bin/env bash

set -e

# Base directory for this entire project
BASEDIR=$(cd $(dirname $0) && pwd)

# Source directory for unbuilt code
SRCDIR="$BASEDIR/src"

# Directory containing dojo build utilities
TOOLSDIR="$SRCDIR/util/buildscripts"

# Destination directory for built code
DISTDIR="$BASEDIR/dist"

# Module ID of the main application package loader configuration
LOADERMID="app/run"

# Main application package loader configuration
LOADERCONF="$SRCDIR/$LOADERMID.js"

# Main application package build configuration
PROFILE="$BASEDIR/profiles/app.profile.js"

#App Framework Config File
APPCONFIG="$SRCDIR/app/config.json"

# Configuration over. Main application start up!

if [ ! -d "$TOOLSDIR" ]; then
	echo "Can't find Dojo build tools -- did you initialise submodules? (git submodule update --init --recursive)"
	exit 1
fi

echo "Building application with $PROFILE to $DISTDIR."

echo -n "Cleaning old files..."
rm -rf "$DISTDIR"
echo " Done"

cd "$TOOLSDIR"

if which node >/dev/null; then
    echo "running node ../../dojo/dojo.js load=build --require "$LOADERCONF" --profile "$PROFILE" --releaseDir "$DISTDIR" --appConfigFile "$APPCONFIG" $@"
	node ../../dojo/dojo.js load=build --require "$LOADERCONF" --profile "$PROFILE" --releaseDir "$DISTDIR" --appConfigFile "$APPCONFIG" $@
    echo "************************If you see this line the build didn't blew up**************************"
elif which java >/dev/null; then
	java -Xms256m -Xmx256m  -cp ../shrinksafe/js.jar:../closureCompiler/compiler.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main  ../../dojo/dojo.js baseUrl=../../dojo load=build --require "$LOADERCONF" --profile "$PROFILE" --releaseDir "$DISTDIR" $@
else
	echo "Need node.js or Java to build!"
	exit 1
fi

cd "$BASEDIR"

LOADERMID=${LOADERMID//\//\\\/}

# Copy & minify index.html to dist
cat "$SRCDIR/index.html" | tr '\n' ' ' | \
perl -pe "
  s/<\!--.*?-->//g;                          # Strip comments
  s/isDebug: *1/deps:['$LOADERMID']/;        # Remove isDebug, add deps
  s/<script src=\"$LOADERMID.*?\/script>//;  # Remove script app/run
  s/\s+/ /g;                                 # Collapse white-space" > "$DISTDIR/index.html"

#Create Mini App for Mobile Development

# Destination directory for built code
MOBILE_DISTDIR="$BASEDIR/mobile/www"
echo -n "Cleaning mobile Mobile Output"
rm -rf "$MOBILE_DISTDIR"
echo " Done"
mkdir -p "$MOBILE_DISTDIR"
cp -a "$DISTDIR/index.html" "$MOBILE_DISTDIR"
cp -a "$DISTDIR/app" "$MOBILE_DISTDIR"
#create dojo stuff
mkdir -p "$MOBILE_DISTDIR/dojo"

#copy dojo stuff
cp -a "$DISTDIR/dojo/dojo.js"  "$MOBILE_DISTDIR/dojo/dojo.js"
cp -a "$DISTDIR/dojo/nls"      "$MOBILE_DISTDIR/dojo"



echo "Build complete"
