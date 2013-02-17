Cheetah - Rapid Prototyping
===========================

## UNDER HEAVY CONSTRUCTION - highly recommend you do not use yet.

Better documentation to come.

## Introduction

Get started with a front-end prototype quickly. Start by running `make define
name=[project-title]`

## Libraries

The following libraries and frameworks are included:

- requirejs
- jQuery
- Modernizr
- Handlebars
- Underscore
- Backbone
- Bootstrap

## Commands

The project comes with some basic terminal commands. Commands include:

- `make copy` - copys all the minimum assets from the `src/components` folder into
  the `site/media/lib` folder
- `make compile` - compiles and minifies all assets (compiles LESS and minifies
  CSS and JS files)
- `make define name=[PROJECT NAME]` - adjusts all asset files to be the project
  name. The following files will get modified:
    - The PROJECTNAME defined in the Makefile
    - The CSS and JS minified assets
    - `main.js` - any reference to the project.js
    - `index.html` - reference to the stylesheet

## Dependencies

- UglifyJS2
- lessc
- yui-compressor
- watchr
- bower
