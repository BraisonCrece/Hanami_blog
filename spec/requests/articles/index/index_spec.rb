RSpec.describe "GET /articles", type: [:request, :database] do
  let(:articles) { app["persistence.rom"].relations[:articles] }

  before do
    articles.insert(title: "Ruby is amazing", body: "Amazing article", author: "Sandi Metz")
    articles.insert(title: "Hanami is the evolution of Rails", body: "Amazing article", author: "Kent Beck")
  end

  it "returns a list of articles" do
    get "/articles"

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq([
      {"title" => "Hanami is the evolution of Rails", "body" => "Amazing article", "author" => "Kent Beck"},
      {"title" => "Ruby is amazing", "body" => "Amazing article", "author" => "Sandi Metz"}
    ])
  end
end
