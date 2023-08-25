# frozen_string_literal: true

module Blog
  module Actions
    module Articles
      class Index < Blog::Action
        include Deps["persistence.rom"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          articles = rom.relations[:articles]
            .select(:title, :author, :body)
            .order(:title)
            .page(request.params[:page] || 1)
            .per_page(request.params[:per_page] || 5)
            .to_a

          response.format = :json
          response.body = articles.to_json
        end
      end
    end
  end
end