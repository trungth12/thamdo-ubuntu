class Thamdo.Models.User extends Backbone.Model
  urlRoot: 'users'

  defaults:
    username: null
    masinhvien: null
    name: null
    id: null

class Thamdo.Collections.UsersCollection extends Backbone.Collection
  model: Thamdo.Models.User
  url: '/api/users'
