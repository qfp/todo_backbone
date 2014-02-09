define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/todo'
], ($, _, Backbone, JST, TodoView) ->

  class ListView extends Backbone.View
    el: '#list-view'

    initialize: ->
      @Todos = @collection
      @.$ul = @.$("#todo-list")

      @listenTo @Todos, 'add', @add
      @listenTo @Todos, 'all', @render

      @Todos.fetch()

    add: (todo)=>
      @todoView = new TodoView model: todo
      @.$ul.append @todoView.render

    events:
      'keypress #new-todo' : 'createOnEnter'
      'click #toggle-all'  : 'toggleAllCompleted'
    render: =>
      @.$ul.html ""
      @Todos.each @add, @

    toggleAllCompleted: ->
      @Todos.toggleAllCompleted()
