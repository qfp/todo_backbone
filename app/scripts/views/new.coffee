define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'collections/todo'
  'views/list'
], ($, _, Backbone, JST, TodoCollection, ListView) ->

  class NewView extends Backbone.View

    el: '#new-view'

    initialize: ->
      @Todos = @collection

    events:
      'keypress #new-todo': 'createOnEnter'

    createOnEnter: (e) ->
      if e.keyCode isnt 13
        return
      $input = $(e.currentTarget)

      @Todos.create
        title: $input.val()

      $input.val('')
