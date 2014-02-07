define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';
  class TodoModel extends Backbone.Model
    default:
      title: "",
      completed: false
