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
    backbone: '../bower_components/backbone/backbone-min'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    localStorage: '../bower_components/backbone.localStorage/backbone.localStorage'

require [
  'backbone'
  'collections/todo'
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
  Todos = new TodoCollection
  listView = new ListView collection: Todos

  new NewView collection: Todos
  new SatusView collection: Todos

  router.on "route:showActive", ->
    listView.render todos: Todos.active()

  router.on "route:showCompleted", ->
    listView.render todos: Todos.completed()

  router.on "route:showAll", ->
    listView.render todos: Todos.models

  Backbone.history.start()
