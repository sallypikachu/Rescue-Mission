require 'pry'
class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    @answer = Answer.new(question: @question, answer: params[:answer]["answer"])
    # @answer = Answer.new(answer_params)
    if @answer.save
      flash.notice = "Answer saved successfully!"
      redirect_to question_path(@question)
    else
      flash.notice = @answer.errors.full_messages.join(", ")
      # redirect_to question_path(@question)
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
