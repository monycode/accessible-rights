class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    #@question = Question.new
    #pendiente - mostrar preguntas ya creadas - otra variable
  end
end
