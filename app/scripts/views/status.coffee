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

      @listenTo @Todos, 'all', @render

      @Todos.fetch()

    events:
      'click #clear-completed' : 'clearCompleted'
      'click #filters li a' : 'moveSelectedClass'

    render: =>
      @.$el.html @template 
        completed: @Todos.completed().length
        remaining: @Todos.remaining().length

    clearCompleted: ->
      @Todos.clearCompleted()

    moveSelectedClass: (e)->
      $("#filters li a").removeClass("selected")      
      $(e.currentTarget).addClass("selected")
