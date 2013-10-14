module Docs
  class Users
    extend WebDoc::Documentable

    set :title,       "Users"
    set :description, "API for managing users."
    set :base_path,   "/api/v0"

    add_common_return :boolean, :success,   "True or false if the requested action was successfull."
    add_common_return :string,  :error_msg, "A message for the error that occured if any occurred."

    get "/users" do |e|
      e.title       "Get Users"
      e.description "Gets a list of users."
    end

    post "/users" do |e|
      e.title       "Create User"
      e.description "Creates a new user"

      e.takes :string, :username,              "The new users username."
      e.takes :string, :password,              "The new users password."
      e.takes :string, :password_confirmation, "The new users password confirmation."

      e.returns :integer, :id, "The ID of the newly created user."
    end

    put "/users/:id" do |e|
      e.title       "Update User"
      e.description "Updates a users information."

      e.takes :string, :username,              "The new users username."
      e.takes :string, :password,              "The new users password."
      e.takes :string, :password_confirmation, "The new users password confirmation."
    end

    get "/users/:id" do |e|
      e.title       "Get User"
      e.description "Gets the information for a single user."

      e.takes :string, :password, "The users password"

      e.returns :string, :username, "The users username"
    end

    delete "/users/:id" do |e|
      e.title       "Delete User"
      e.description "Deletes a user"

      e.takes :string, :password, "The users password"
    end
  end
end
