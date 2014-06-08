module Docs
  class Articles
    extend WebDoc::Documentable

    set :title,       "Articles"
    set :description, "API for managing articles."
    set :base_path,   "/api/v0"

    get '/articles' do |e|
      e.title       'Get Articles'
      e.description 'Gets a list of articles'
    end

    post '/users' do |e|
      e.title       'Create Article'
      e.description 'Creates a new article'

      e.takes :string, :title, 'The title of the new article'
      e.takes :string, :body,  'The content of the new article'
    end
  end
end
