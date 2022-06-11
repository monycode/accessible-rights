class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.save
  end

  private

  def question_params
    params.require(:booking).permit(:title, :content)
  end
end
