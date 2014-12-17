class AnswersController < ApplicationController
  def new

    @answer = parent.answers.new
  end

  def create

    @answer = parent.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(parent)
    else
      @errors = @answer.errors.full_messages
      render new_question_path
    end
  end

  def show
    redirect_to question_path(parent)
  end



private
  def parent
    @question ||= Question.find(params[:question_id])
  end
  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
