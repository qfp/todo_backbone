define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/list'
], ($, _, Backbone, JST, ListView) ->

  class NewView extends Backbone.View

    el: '#new-view'

    initialize: ->
      @Todos = @collection

    events:
      'keypress #new-todo': 'createOnEnter'

    createOnEnter: (e) ->
      return if e.keyCode isnt 13
      $input = $(e.currentTarget)
      @Todos.create title: $input.val()
      
      $input.val('')
