module Blog
  module Persistence
    module Relations
      class Articles < ROM::Relation[:sql]
        schema(:articles, infer: true)

        use :pagination
        per_page 5
      end
    end
  end
end
