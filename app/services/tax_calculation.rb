class TaxCalculation
  NZ_2025_BANDS = [
    { up_to: BigDecimal("15600"), rate: BigDecimal("0.105") },
    { up_to: BigDecimal("53500"), rate: BigDecimal("0.175") },
    { up_to: BigDecimal("78100"), rate: BigDecimal("0.30") },
    { up_to: BigDecimal("180000"), rate: BigDecimal("0.33") },
    { up_to: nil, rate: BigDecimal("0.39") }
  ].freeze

  attr_reader :income, :bands

  def initialize(income:, bands: NZ_2025_BANDS)
    @income = BigDecimal(income.to_s)
    @bands = bands
  end

  def tax_owed
    previous_threshold = BigDecimal("0")

    total = bands.sum(BigDecimal("0")) do |band|
      current_threshold = band[:up_to] || income
      taxable_amount = [ income, current_threshold ].min - previous_threshold
      taxable_amount = [ taxable_amount, BigDecimal("0") ].max
      previous_threshold = current_threshold

      taxable_amount * band[:rate]
    end

    total.round(2)
  end
end
