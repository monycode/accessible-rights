class RightsController < ApplicationController

  skip_before_action :authenticate_user!

  def termination

  end

  def resignation

  end

  def unpaid_bonus

  end

  def unpaid_hours

  end

  # def show
  #
  # end





  # get 'termination', to: 'rights#termination'
  # get 'resignation', to: 'rights#resignation'
  # get 'unpaid_bonus', to: 'rights#unpaid_bonus'
  # get 'unpaid_hours', to: 'rights#unpaid_hours'
end
