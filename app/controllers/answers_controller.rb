class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      # mail = UserMailer.with(answer: @answer).new_answer
      # mail.deliver_now
      redirect_to question_path(@question)
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
