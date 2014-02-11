define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class TodoView extends Backbone.View
    template: JST['app/scripts/templates/todo.ejs']

    tagName: 'li'

    events:
      "click .destroy" : "destroy"
      "dblclick label" : "edit"
      'blur .edit'     : 'updateTitle'
      'keypress .edit' : 'updateTitleOnEnter'
      'click .toggle'  : 'toggleCompleted'
    initialize: ->
      @todo = @model
      @render()
      @.$input = @.$(".edit")

    render: ->
      @.$el.html(@template @todo.toJSON())
      @.$el.toggleClass('completed', @todo.get('completed'))

    destroy: ->
      @todo.destroy()

    edit: ->
      @.$el.addClass("editing")
      #@.$input.focus()

    updateTitle: ->
      newTitle = @.$input.val().trim()
      @todo.save title: newTitle if newTitle
      @.$el.removeClass("editing")

    updateTitleOnEnter: (e)->
      @updateTitle() if e.keyCode is 13

    toggleCompleted: ->
      @todo.toggleCompleted()
