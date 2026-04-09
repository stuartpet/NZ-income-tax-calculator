require "rails_helper"

RSpec.describe TaxCalculation do
  describe "#tax_owed" do
    {
      "10000" => "1050.00",
      "35000" => "5033.00",
      "100000" => "22877.50",
      "220000" => "64877.50",
      "53500" => "8270.50",
      "78100" => "15650.50",
      "180000" => "49277.50"
    }.each do |income, expected_tax|
      it "returns #{expected_tax} for income #{income}" do
        calculation = described_class.new(income:)

        expect(calculation.tax_owed).to eq(BigDecimal(expected_tax))
      end
    end

    it "supports decimal income values" do
      calculation = described_class.new(income: "100000.55")

      expect(calculation.tax_owed).to eq(BigDecimal("22877.68"))
    end

    it "returns zero for zero income" do
      calculation = described_class.new(income: "0")

      expect(calculation.tax_owed).to eq(BigDecimal("0"))
    end
  end
end
