module MockDoc
  extend WebDoc::Documentable

  set :title,       "Mock Document"
  set :description, "Mock Document for RSpec testing"
  set :base_path,   "/api/v1"

  add_common_take :string, :name, "Just a name"

  add_common_return :integer, :code, "Just a code"

  get "/users" do |e|
    e.title       "Get Users"
    e.description "Get a list of users"
  end

  post "/users" do |e|
    e.title       "Create User"
    e.description "Creates a new user"

    e.takes :string, :username, "The new users username"
    e.takes :string, :password, "The new users password"

    e.returns :integer, :id, "The new users ID"
  end

  put "/users/:id" do |e|
    e.title       "Update User"
    e.description "Updates a users account"
  end

  patch "/users/:id" do |e|
    e.title       "Update User"
    e.description "Updates a users account"
  end

  delete "/users/:id" do |e|
    e.title       "Delete User"
    e.description "Deletes a users account"
  end

  options "/users/:id" do |e|
    e.title       "Options User"
    e.description "Preflight request for CORS"
  end
end