Cheetah - Rapid Prototyping
===========================

Better documentation to come.

## Introduction

Get started with a front-end prototype quickly

## Libraries

The following libraries and frameworks are included:

- requirejs
- jQuery
- Modernizr
- Underscore
- Backbone
- Bootstrap

## Commands

The project comes with a basic make file. Commands include:

- `make compile` - compiles and minifies all assets (compiles LESS and minifies
  CSS and JS files)
- `make define name=[PROJECT NAME]` - adjusts all asset files to be the project
  name. The following files will get modified:
    - The PROJECTNAME defined in the Makefile
    - The CSS and JS minified assets
    - `main.js` - any reference to the project.js
    - `index.html` - reference to the stylesheet