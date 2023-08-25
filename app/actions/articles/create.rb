# frozen_string_literal: true

module Blog
  module Actions
    module Articles
      class Create < Blog::Action
        include Deps["persistence.rom"]

        params do
          required(:article).hash do
            required(:title).filled(:string)
            required(:body).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            article = rom.relations[:articles].changeset(:create, request.params[:article]).commit

            response.status = 201
            response.body = article.to_json
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end
        end
      end
    end
  end
end
