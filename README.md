A Starter Kit for SPA (Single Page Apps)
===

- The Boilerplate is a set of files to help you rapidly get up and running a SPA
- Helps you build your SPA which some times consumes a lot of time when starting a new SPA
- The SPA provides optional creation of Hybrid App using [Apache Cordova/PhoneGap](http://cordova.io)

Installing
===
### Clone Project

    git clone https://github.com/csantanapr/dapp-boilerplate.git
    cd dapp-boilerplate

### Install CLI Dependencies

Use  [NPM](http://npmjs.org):

    npm install

Downloads cli dependencies to `node_modules/`

### Install Browser Dependencies
Use [Bower](http://bower.io) or [Volo](http://volojs.org)

    bower install
    or
    volo install

Downloads browser dependencies to `components/`

----

Development Workflow (Use Grunt to preview, lint, build)
===
Use grunt to run tasks, for more available tasks run `grunt --help`

### Preview Source with watch and liverelaod
    grunt server

### Preview Distribution
    grunt server:dist

### Lint
    grunt lint

### Build
Be happy, and stop crying because you can't figure out how to build dojo or create a hybrid App as fast and simple as it should be.

Believe me I cried a lot :-(

    grunt build

### Optional: Hybrid App (Apache Cordova/PhoneGap)

To build web and cordova run:

    grunt build_all

To run Simulators (Apple iOS, Android) run:

    grunt cordova_emulate

To run just Apple iOS Simulator run:

    grunt cordovacli:emualte_ios

To run just Android Simulator run:

    grunt cordovacli:emualte_android

----

### Windows Users

If you have [msysgit](http://git-scm.com) installed, run Git Bash and verify
some dependencies by running the following commands:

    which node

Node will reward you with much faster builds.

A brief tour
----

* The starting point of the boilerplate is the file at `src/index.html` and `src/app/main.js`
  It's responsible for loading the Dojo loader and the application’s
  bootstrapper with `config.json`
* The file `grunt build` takes your application files and builds them for
  production using the Dojo build tool.
  * It depends on the presence of the build profile at `profiles/app.profile.js` and App config `src/app/config.json`
* The App creates an instance of `dojox/app/main` using the App Controller Configuration File  `src/app/config.json`
* The file `src/app/config.json` its the brain that composes the App and also used to discover dependencies for Dojo Build
* The file `src/app/views/css/app.css` contains import statements to load the CSS it's inserted from `src/index.html`
* The file `src/app/views/app.js` is an additional App Controller
* The file `src/app/views/app.html` contains the App level html template and its specified in `src/app/config.json`
* The directories inside `src/app/views/[view1 | view2 | view3]` contain View level module composed of css/images/html/js
* JS = ViewControllers, HTML=ViewTemplates
* Add View Templates, View Controllers, and Object Stores (i.e. Models) starting by modifying the `src/app/config.json`
* The provided directory structure for css, html, and js for your App is defined in config.json, you can change to a different convention

Useful resources
----------------

* [Dojox/App Tutorial](http://dojotoolkit.org/documentation/tutorials/1.9/dojox_app)
* [Dojox/App Reference](http://dojotoolkit.org/reference-guide/dojox/app.html#dojox-app)

About the boilerplate
---------------------

- This project started because I always spent a few weeks getting started with a new version of Dojo, and want to give a try to the MV* dApp Framework.
- This boilerplate is constantly updated to try to reflect the latest and
greatest features and design patterns for developing Single Page App, but
it relies heavily on information and contributions from other users.
- If you have an idea, suggestion, or problem, please [report
it](https://github.com/csantanapr/dojo-app-boilerplate/issues) or create a pull
request! (Please note that you will need to have signed the [Dojo
CLA](http://dojofoundation.org/about/cla) before your pull requests are
accepted, for the good of us all!)

Change Log
---

#### Version 0.1.9
- Fix Cordova build should be optional
- Added csslint
- Added htmlhint
- Added html validation
- Added json lint

#### Version 0.1.8
- Replace cordova.sh with [grunt-cordovacli](https://npmjs.org/package/grunt-cordovacli) plugin

#### Version 0.1.7
- Fix mising npm dependency matchdep
- Fix added copy_dojox_hack as part of grunt server task

#### Version 0.1.6
- Fix build dist nls files not copied
- Fix grunt server:dist task

#### Version 0.1.5
- Implemented Initial support for [Grunt](http://gruntjs.com)

#### Version 0.1.4
- Implemented JS lib dependencies using components with bower or volo

#### Version 0.1.3
- Added Android platform as default in cordova.sh

#### Version 0.1.2
- Fix Build Scripts to include local path
- Fix npm package.json to include uglify-js
- Updated Readme to indicate user to run `npm install`

#### Version 0.1.0
- Build Scripts
  - Fast dojo builds using uglifyjs
  - Small Distribution output
  - National Language Support (i18n)
- Example App with dojox/app features
  - View Templates (HTML)
  - View Controller (JS)
  - Transitions (CSS3 hardware accelerated)
  - JQuery Style syntax for DOM and Events
  - Object Stores Stores (Memory, MongoDB-JSONREST)
  - Dojo Mobile UI
- Integration with new Apache Cordova 3.0 CLI




Future
---

- Integrate Automation Testing
  - Add unit tests (i.e. Jasmine or Mocha)
  - Add functional testing (Webdriver API)
  - Run Unit and Functional Testing using [The Intern](https://github.com/theintern/intern) leveraging the [ Intern Tutorial](https://github.com/theintern/intern-tutorial)
- Basic boilerplate to create App generator/scaffolding for other projects:
  - [Yoeman](http://yeoman.io)
  - [IBM Worklight](http://ibm.com/mobilefirst)
- Examples on how to integrate Dojox/App with other Projects:
  - [Handlebars](http://handlebarsjs.com)
  - [JQuery](http://jquery.com)
- Education resources on [dApp website](http://csantanapr.github.io/dapp-boilerplate)
  - Getting Started
  - Screencasts
  - Tutorials
- Next-Gen 2.x
  - [Aura](http://aurajs.com)
  - [BackBoneJS](http://backbonejs.org)
  - [AngularJS](http://angularjs.org)

Dual License
--
The DApp Boilerplate is licensed under the [same
terms](https://github.com/dojo/dojo/blob/master/LICENSE) as the Dojo
Toolkit.

* [BSD](https://github.com/dojo/dojo/blob/master/LICENSE#L13)
* [AFLv2.1](https://github.com/dojo/dojo/blob/master/LICENSE#L43)


Thanks
---
- Huge thanks go out to [csnover](https://github.com/csnover) and the other contributors for the original [dojo-boilerplate](https://github.com/csnover/dojo-boilerplate) project.
