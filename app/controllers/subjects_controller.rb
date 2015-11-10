class SubjectsController < ApplicationController
  def test
    @exam = Exam.find_by_id(params[:exam_id])
    @subject = @exam.subjects.find_by_id(params[:id])
  end
end
