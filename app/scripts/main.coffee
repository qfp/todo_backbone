#/*global require*/
'use strict'

require.config
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
  paths:
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    localStorage: '../bower_components/backbone.localStorage/backbone.localStorage'

require [
  'backbone'
  'collections/todos'
  'views/new'
  'views/list'
  'views/status'
  'routes/router'
], (
Backbone,
TodoCollection,
NewView,
ListView,
SatusView,
Router) ->
  router = new Router()
  Backbone.history.start()
