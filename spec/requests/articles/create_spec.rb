RSpec.describe "POST /articles", type: [:request, :database] do
  let(:request_headers) do
    { "HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json" }
  end

  context "given valid params" do
    let(:params) do
      { article: { title: "Practical Object-Oriented Design in Ruby", body: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz" } }
    end

    it "creates a article" do
      # METHOD - ENDPOINT - BODY - HEADERS
      post "/articles", params.to_json, request_headers
      expect(last_response).to be_created
    end
  end

  context "given invalid params" do
    let(:params) do
      { article: { title: nil } }
    end

    it "returns 422 unprocessable" do
      post "/articles", params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
