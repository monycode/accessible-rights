class CalculationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    # @result = Calculator.send(params[:compensation], [params[:cause_of_termination]])
  end
end
