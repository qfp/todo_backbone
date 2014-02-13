define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/todo'
], ($, _, Backbone, JST, TodoView) ->

  class SatusView extends Backbone.View
    template: JST['app/scripts/templates/status.ejs']
    el: '#status-view'

    initialize: ->
      @Todos = @collection
      @render()
      @listenTo @Todos, 'all', @render

    events:
      'click #clear-completed' : 'clearCompleted'
      'click #filters a' : 'moveSelectedClass'

    render: =>
      @.$el.html @template 
        completed: @Todos.completed().length
        remaining: @Todos.remaining().length

    clearCompleted: ->
      @Todos.clearCompleted()

    moveSelectedClass: (e)->
      $("#filters li a").removeClass("selected")      
      $(e.currentTarget).addClass("selected")
