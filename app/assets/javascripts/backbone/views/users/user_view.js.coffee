Thamdo.Views.Users ||= {}

class Thamdo.Views.Users.UserView extends Backbone.View
  template: JST["backbone/templates/users/user"]

  
  tagName: "tr"
  
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
