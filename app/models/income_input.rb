class IncomeInput
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :string

  validates :amount, presence: true
  validate :amount_must_be_numeric
  validate :amount_must_not_be_negative

  def income
    @income ||= BigDecimal(amount)
  rescue ArgumentError
    nil
  end

  private

  def amount_must_be_numeric
    return if amount.blank?
    return if income

    errors.add(:amount, "must be a number")
  end

  def amount_must_not_be_negative
    return unless income
    return if income >= 0

    errors.add(:amount, "must be zero or more")
  end
end
