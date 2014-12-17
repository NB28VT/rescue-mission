class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render 'index'
    else
      @errors = @question.errors.full_messages
      render 'new'
    end
  end

private
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
