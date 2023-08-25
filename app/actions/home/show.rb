# frozen_string_literal: true

module Blog
  module Actions
    module Home
      class Show < Blog::Action
        def handle(request, response)
          name = request.params[:name]

          response.body = "Hello from Blog!"
        end
      end
    end
  end
end
