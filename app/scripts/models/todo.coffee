define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';
  class TodoModel extends Backbone.Model

    defaults:
      completed: false
      title: ""
