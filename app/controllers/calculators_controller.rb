class CalculatorsController < ApplicationController
  def show
    @income_input = IncomeInput.new
  end

  def create
    @income_input = IncomeInput.new(income_input_params)
    return render(:show, status: :unprocessable_content) unless @income_input.valid?

    @calculation = TaxCalculation.new(income: @income_input.income)
    render :show
  end

  private

  def income_input_params
    params.require(:income_input).permit(:amount)
  end
end
