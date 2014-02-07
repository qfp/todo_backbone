define [
  'underscore'
  'backbone'
  'models/todo'
  'localStorage'
], (_, Backbone, TodoModel, LocalStorage) ->

  class TodoCollection extends Backbone.Collection
    model: TodoModel
    localStorage: new LocalStorage 'todos-backbone'
