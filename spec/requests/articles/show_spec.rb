RSpec.describe "GET /articles/:id", type: [:request, :database] do
  let(:articles) { app["persistence.rom"].relations[:articles] }

  context "when a article matches the given id" do
    let!(:article_id) do
      articles.insert(title: "Test Driven Development", body: "Test Driven Development Article", author: "Kent Beck")
    end

    it "renders the article" do
      get "/articles/#{article_id}"

      expect(last_response).to be_successful
      expect(last_response.content_type).to eq("application/json; charset=utf-8")

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "id" => article_id, "title" => "Test Driven Development", "body" => "Test Driven Development Article", "author" => "Kent Beck",
      )
    end
  end

  context "when no article matches the given id" do
    it "returns not found" do
      get "/articles/#{articles.max(:id).to_i + 1}"

      expect(last_response).to be_not_found
      expect(last_response.content_type).to eq("application/json; charset=utf-8")

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "error" => "not_found",
      )
    end
  end
end
