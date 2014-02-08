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
      "click .destroy": "destroy"
    initialize: ->
      @todo = @model

    render: =>
      this.$el.html(@template @todo.toJSON())

    destroy: ->
      @todo.destroy()
