class Answer < ActiveRecord::Base
  attr_accessor :correct
  belongs_to :question
  after_create :create_correct_answer

  def create_correct_answer
    question = Question.find_by_id(self.question_id)
   if  correct == '1'
     if question.correct_answer.present?
       question.correct_answer << ','  << self.id.to_s
       question.save
     else
       question.correct_answer = self.id.to_s
       question.save
     end
   end
  end
end
