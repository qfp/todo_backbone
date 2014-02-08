define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/todo'
], ($, _, Backbone, JST, TodoView) ->

  class ListView extends Backbone.View
    el: '#todo-list'

    initialize: ->
      @Todos = @collection
      @listenTo @Todos, 'add', @add
      @listenTo @Todos, 'all', @render

      @Todos.fetch()

    add: (todo)->
      @todoView = new TodoView
        model: todo
      this.$el.append @todoView.render

    events:
      'keypress #new-todo': 'createOnEnter'

    render: =>
      @.$el.html('')
      @Todos.each @add, @
