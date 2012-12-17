requirejs.config({
    baseUrl: 'media/js/',

    paths: {
        // Dependencies
        'jquery'        : '../lib/jquery/jquery-1.8.2.min',

        'underscore'    : '../lib/underscore/underscore-min',
        'backbone'      : '../lib/backbone/backbone-min',

        'handlebars'    : '../lib/handlebars/handlebars-1.0.rc.1',

        'bootstrap'     : '../lib/bootstrap/js/bootstrap.min',

        // Project
        'cheetah'    : 'cheetah'

        // Modules
    },

    shim: {
        'backbone': {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        'underscore': {
            deps: [],
            exports: '_'
        }
    }
});

require(['cheetah']);
