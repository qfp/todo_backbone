define [
  'backbone'
  'collections/todos'
  'views/new'
  'views/list'
  'views/status'
], (Backbone, TodoCollection, NewView, ListView, StatusView) ->
  class ApplicationRouter extends Backbone.Router
    routes:
      "active": "showActive"
      "completed": "showCompleted"
      "all": "showAll"

    showCompleted: ->
      new ListView collection: @Todos, todos: @Todos.completed()

    showActive: ->
      new ListView collection: @Todos, todos: @Todos.remaining()

    initialize: ->
      @Todos = new TodoCollection()
      @Todos.fetch()
      new NewView collection: @Todos
      new ListView collection: @Todos, todos: @Todos.models
      new StatusView collection: @Todos
