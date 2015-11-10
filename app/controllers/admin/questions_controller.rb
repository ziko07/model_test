class Admin::QuestionsController < Admin::AdminController
  def new

  end

  def edit

  end

  def update

  end

  def index

  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def create
    subject = Subject.find_by_id(params[:subject_id])
    question = subject.questions.build(question_params)
    if question.save
      redirect_to admin_exam_subject_path(subject.exam_id,subject.id)
    else
     render 'new'
    end
  end

  def update_correct_answer
   @question = Question.find_by_id(params[:question_id])
   @question.correct_answer = ''
   @question.correct_answer = params[:correct_answer]
   @question.save
  end

  private

  def question_params
    params.require(:question).permit!
  end
end
