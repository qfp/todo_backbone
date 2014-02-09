define [
  'backbone'
  'collections/todo'
  'views/new'
  'views/list'
  'views/status'
], (Backbone, TodoCollection, NewView, ListView, StatusView) ->
  class ApplicationRouter extends Backbone.Router
    routes:
      "active": "showActive"
      "completed": "showCompleted"
      "all": "showAll"
    
   #  initialize: ->
   #  	@Todos = new TodoCollection
   #  	new NewView collection: @Todos
   #  	@listView = new ListView collection: @Todos
   #  	new StatusView collection: @Todos

   #  completed: ->
   #  	alert "completed"
			# #@listView.render
			# 	#todos: @Todos.completed()

	  # active: ->
	  # 	alert "active"
   #  	#@listView.render
   #  		#todos: @Todos.remaining()



