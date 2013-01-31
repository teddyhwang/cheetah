requirejs.config({
    baseUrl: 'media/js/',

    paths: {
        // Dependencies
        'jquery'        : '../lib/jquery/jquery.min',

        'underscore'    : '../lib/underscore/underscore-min',
        'backbone'      : '../lib/backbone/backbone-min',

        'handlebars'    : '../lib/handlebars/handlebars',

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
