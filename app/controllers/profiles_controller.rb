class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end
end
