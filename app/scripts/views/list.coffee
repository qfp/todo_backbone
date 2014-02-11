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

    add: (todo)->
      @todoView = new TodoView model: todo
      @.$ul.append @todoView.$el

    events:
      'keypress #new-todo' : 'createOnEnter'
      'click #toggle-all'  : 'toggleAllCompleted'

    render: (options)->
      @.$ul.html ""
      todos = options.todos
      if todos
        _(todos).each (todo) => @add todo
      else
        @Todos.each @add, @

    toggleAllCompleted: ->
      @Todos.toggleAllCompleted()
