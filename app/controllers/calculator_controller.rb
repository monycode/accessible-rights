class CalculatorController < ApplicationController
  skip_before_action :authenticate_user!
  def calculator
  end

  def new
    @result = Calculator.daily_salary + Calculator.vacations + Calculator.vacation_bonus_total + Calculator.christmas_bonus + Calculator.unpaid_working_days + Calculator.compensation
    render :index
  end
end
