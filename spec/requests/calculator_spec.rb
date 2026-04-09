require "rails_helper"

RSpec.describe "Calculator", type: :request do
  describe "GET /" do
    it "renders the calculator" do
      get root_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("NZ Income Tax Calculator")
    end
  end

  describe "POST /calculator" do
    it "shows the calculated tax for a valid income" do
      post calculator_path, params: { income_input: { amount: "100000" } }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("$100,000.00")
      expect(response.body).to include("$22,877.50")
    end

    it "shows validation errors for invalid input" do
      post calculator_path, params: { income_input: { amount: "abc" } }

      expect(response).to have_http_status(:unprocessable_content)
      expect(response.body).to include("Amount must be a number")
    end
  end
end
