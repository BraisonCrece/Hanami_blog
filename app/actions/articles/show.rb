module Blog
  module Actions
    module Articles
      class Show < Blog::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          article = rom.relations[:articles].by_pk(
            request.params[:id]
          ).one!

          response.format = :json
          response.body = article.to_json
        end
      end
    end
  end
end
