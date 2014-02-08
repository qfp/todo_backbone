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
      #alert 1
      @Todos = new TodoCollection
      new ListView
        collection: @Todos


    events:
      'keypress #new-todo': 'createOnEnter'

    createOnEnter: (e) ->
      if e.keyCode isnt 13
        return
      $input = $(e.currentTarget)
      _title = $input.val()

      $input.val('')

      @Todos.create
        title: _title
