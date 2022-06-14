class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])
    @question = Question.new
    #pendiente - mostrar preguntas ya creadas - otra variable
  end
end
