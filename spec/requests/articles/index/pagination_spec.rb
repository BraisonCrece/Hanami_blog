RSpec.describe "GET /articles pagination", type: [:request, :database] do
  let(:articles) { app["persistence.rom"].relations[:articles] }

  before do
    10.times do |n|
      articles.insert(title: "Article #{n}", body: "Body #{n}", author: "Author #{n}")
    end
  end

  context "given valid page and per_page params" do
    it "returns the correct page of articles" do
      get "/articles?page=1&per_page=3"

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq([
        { "title" => "Article 0", "body" => "Body 0", "author" => "Author 0" },
        { "title" => "Article 1", "body" => "Body 1", "author" => "Author 1" },
        { "title" => "Article 2", "body" => "Body 2", "author" => "Author 2" }
      ])
    end
  end

  context "given invalid page and per_page params" do
    it "returns a 422 unprocessable response" do
      get "/articles?page=-1&per_page=3000"

      expect(last_response).to be_unprocessable

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "errors" => {
          "page" => ["must be greater than 0"],
          "per_page" => ["must be less than or equal to 100"]
        }
      )
    end
  end

  context "without params" do
    it "returns the default page of articles" do
      get "/articles"

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq([
        { "title" => "Article 0", "body" => "Body 0", "author" => "Author 0" },
        { "title" => "Article 1", "body" => "Body 1", "author" => "Author 1" },
        { "title" => "Article 2", "body" => "Body 2", "author" => "Author 2" },
        { "title" => "Article 3", "body" => "Body 3", "author" => "Author 3" },
        { "title" => "Article 4", "body" => "Body 4", "author" => "Author 4" }
      ])
    end
  end
end
