class Admin::ExamsController < Admin::AdminController
  def new
    @exam = Exam.new
  end

  def edit

  end

  def update

  end

  def index
   @exams = Exam.all
  end

  def show
    @exam = Exam.find_by_id(params[:id])
    @subject_lists = @exam.subjects
    @subject = Subject.new
  end

  def create
    @exam = Exam.new(exam_params)
    respond_to do |format|
      if @exam.save
        format.html { redirect_to admin_exams_path, success: 'New exam has been created' }
      else
        render 'new'
      end
    end
  end

  protected

  def exam_params
    params.require(:exam).permit!
  end

end
