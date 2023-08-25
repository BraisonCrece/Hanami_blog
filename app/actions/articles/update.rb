module Blog
  module Actions
    module Articles
      class Update < Blog::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
          required(:article).hash do
            optional(:title).filled(:string)
            optional(:body).filled(:string)
          end
        end

        # TODO ===========>
        def handle(request, response)
          # article = rom
          #   .relations[:articles]
          #   .by_pk(request.params[:id])
          #   .one
          #   .changeset(:update, title: request.params[:article][:title], body: request.params[:article][:body])
          #   .commit

          # response.format = :json
          # response.body = article.to_json
        end
      end
    end
  end
end
