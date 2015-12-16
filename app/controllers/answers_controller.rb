require 'pry'
class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      flash.notice = "Answer saved successfully!"
      redirect_to question_path(@question)
    else
      flash.notice = @answer.errors.full_messages.join(", ")
      render 'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(
    :question_id,
    :answer
    )
  end
end
