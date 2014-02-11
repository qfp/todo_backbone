define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';
  class TodoModel extends Backbone.Model

    defaults:
      completed: false
      title: ""

    toggleCompleted: ->
      @save completed: not @get 'completed'
