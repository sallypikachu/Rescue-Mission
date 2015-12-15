class QuestionsController < ApplicationController
  def index
    @message = flash.notice
    @questions = Question.order(created_at: :desc)
  end

  def show
    @message = flash.notice
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash.notice = "Question created!"
      redirect_to questions_path
    else
      @message = "Question not created"
      render "new"
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash.notice = "Question updated!"
      redirect_to question_path
    else
      @message = "Question not updated"
      render "edit"
    end
  end

  def question_params
    params.require(:question).permit(
    :title,
    :description
    )
  end
end
