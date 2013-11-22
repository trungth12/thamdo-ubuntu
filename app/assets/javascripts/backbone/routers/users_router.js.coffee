class Thamdo.Routers.UsersRouter extends Backbone.Router
  initialize: ->
    @users = new Thamdo.Collections.UsersCollection()    
    @users.fetch
      success: =>
          console.log @users.toJSON
                                      
  routes:   
    "index"    : "index"    
    ":id"      : "show"
    ".*"        : "index"
 
  index: ->    
    @view = new Thamdo.Views.Users.IndexView(users: @users)
    $("#users").html(@view.render().el)

  show: (id) ->
    user = @users.get(id)
    @view = new Thamdo.Views.Users.ShowView(model: user)
    $("#users").html(@view.render().el)

