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
      'keypress .edit' : 'updateTitle'
    initialize: ->
      @todo = @model

    render: =>
      this.$el.html(@template @todo.toJSON())

    destroy: ->
      @todo.destroy()

    edit: ->
      @.$el.addClass("editing")
      @.$(".edit").focus()

    updateTitle: ->
      newTitle = @.$(".edit").val().trim()
      @todo.save title: newTitle if newTitle
      @.$el.removeClass("editing")
