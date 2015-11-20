class SubjectsController < ApplicationController
  before_action :authenticate_user!

  def test
    exam = Exam.find_by_id(params[:exam_id])
    subject = exam.subjects.find_by_id(params[:id])
    model_test = current_user.model_tests.build(subject_id: subject.id)
    respond_to do |format|
      if model_test.save!
        format.html { redirect_to start_model_test_path(model_test.id) }
      else
        format.html { redirect_to :back }
      end
    end
  end
end
