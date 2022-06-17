class CalculatorController < ApplicationController
  skip_before_action :authenticate_user!
  def calculator
  end

  def new
    @result = Calculator.total
    render :index
  end
end
