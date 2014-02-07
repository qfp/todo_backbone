define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->

  class ListView extends Backbone.View
    el: '#todo-list'

    initialize: ->
      alert @Todos
      # @listenTo @Todos, 'all', @render

    events:
      'keypress #new-todo': 'createOnEnter'

    render: ->
