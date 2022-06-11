class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @forum = Forum.find(params[:forum_id])
    @question.forum = @forum
    @question.save

    if @question.save!
      redirect_to forum_path(@forum)
    else
      render "forums/show"
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
