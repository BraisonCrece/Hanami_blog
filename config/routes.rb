# frozen_string_literal: true

module Blog
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/articles", to: "articles.index"
    get "/articles/:id", to: "articles.show"
    post "/articles", to: "articles.create"
    patch "/articles/:id", to: "articles.update"
  end
end
