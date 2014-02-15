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
      @render()

    events:
      'click #clear-completed' : 'clearCompleted'

    render: ->
      @.$el.html @template 
        completed: @Todos.completed().length
        remaining: @Todos.remaining().length
      @adjustSelectedClass()

    clearCompleted: ->
      @Todos.clearCompleted()

    adjustSelectedClass: ->
      $("#filters a").removeClass("selected")      
      @currentActiveLink().addClass("selected")

    currentActiveLink: ->
      router = Backbone.history.fragment
      candidateLink = $("#filters a[href$="+router+"]")
      
      if candidateLink.length isnt 0
        return candidateLink
      else
        return $("#filters a[href$='all']")
