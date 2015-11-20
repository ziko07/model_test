class ModelTestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @model_test = ModelTest.find_by_id(params[:id])
    @subject = @model_test.subject
    @exam = @subject.exam
  end

  def answer
    question_set = QuestionSet.find_or_initialize_by(question_id: params[:question_id], model_test_id: params[:test_id])
    question_set.correct_answer = params[:answer]
    question_set.save
    respond_to do |format|
      format.json {
        render json: {status: 200}
      }
    end
  end

  def result
    @model_test = ModelTest.find_by_id(params[:id])
    @subject = @model_test.subject
    @exam = @subject.exam
    UserMailer.result_mail(current_user).deliver
  end

end
