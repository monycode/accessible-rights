class CalculationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @calculation = Calculation.new
  end

  def create
    @calculation = Calculation.new(calculation_params)
    render :new
  end

  private

  def calculation_params
    params.require(:calculation).permit(:start_date, :end_date, :monthly_salary, :vacation_days, :christmas_bonus_days, :cause_of_termination)
  end
end
