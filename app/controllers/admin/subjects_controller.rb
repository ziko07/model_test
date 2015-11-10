class Admin::SubjectsController < Admin::AdminController
  def new

  end

  def edit

  end

  def update

  end

  def index

  end

  def show
    @subject =  Subject.find_by_id(params[:id])
    @questions = @subject.questions
    @question = Question.new
    4.times do
      @answer = @question.answers.build
    end
  end

  def create
    exam = Exam.find_by_id(params[:exam_id])
    subject = exam.subjects.build(subject_params)
    subject.save
    redirect_to admin_exams_path(exam)
  end

  private

  def subject_params
    params.require(:subject).permit!
  end

end
