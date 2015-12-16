class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
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
      flash.notice = "Question not created"

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

  def destroy
    @question = Question.find(params[:id])
    @question.answers.destroy
    @question.destroy

    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(
    :title,
    :description
    )
  end
end
