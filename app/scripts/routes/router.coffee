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
      "*default": "showAll"

    showCompleted: ->
      @listView.render methodName: "completed"  
      @statusView.render()

    showActive: ->
      @listView.render methodName: "active" 
      @statusView.render()

    showAll: ->
      @listView.render methodName: "all" 
      @statusView.render()

    initialize: ->
      @Todos = new TodoCollection()
      @Todos.fetch()
      
      new NewView collection: @Todos
      @listView = new ListView collection: @Todos
      @statusView = new StatusView collection: @Todos
      

