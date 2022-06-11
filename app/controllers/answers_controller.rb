class AnswersController < ApplicationController

  def create
    @question = question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save!
      redirect_to forum_path(@question)
    else
      render "forums/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
