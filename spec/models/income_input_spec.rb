require "rails_helper"

RSpec.describe IncomeInput do
  describe "#valid?" do
    it "accepts whole numbers" do
      input = described_class.new(amount: "35000")

      expect(input).to be_valid
    end

    it "accepts decimal amounts" do
      input = described_class.new(amount: "35000.75")

      expect(input).to be_valid
    end

    it "rejects blank values" do
      input = described_class.new(amount: "")

      expect(input).not_to be_valid
      expect(input.errors[:amount]).to include("can't be blank")
    end

    it "rejects negative values" do
      input = described_class.new(amount: "-1")

      expect(input).not_to be_valid
      expect(input.errors[:amount]).to include("must be zero or more")
    end

    it "rejects non-numeric values" do
      input = described_class.new(amount: "abc")

      expect(input).not_to be_valid
      expect(input.errors[:amount]).to include("must be a number")
    end
  end
end
