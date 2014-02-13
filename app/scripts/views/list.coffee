define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/todo'
], ($, _, Backbone, JST, TodoView) ->

  class ListView extends Backbone.View
    el: '#list-view'

    initialize: (options)->
      @Todos = @collection
      @todos = options.todos
      @.$ul = @.$("#todo-list")
      @render()

      @listenTo @Todos, 'add', @add
      @listenTo @Todos, 'all', @render

    add: (todo)->
      @todoView = new TodoView model: todo
      @.$ul.append @todoView.$el

    events:
      'keypress #new-todo' : 'createOnEnter'
      'click #toggle-all'  : 'toggleAllCompleted'

    render: ->
      @.$ul.html ""
      _(@todos).each (todo) => @add todo

    toggleAllCompleted: ->
      @Todos.toggleAllCompleted()
