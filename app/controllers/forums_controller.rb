class ForumsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @forum = Forum.find_by(name: params[:name])
    @question = Question.new
    #pendiente - mostrar preguntas ya creadas - otra variable
  end
end
