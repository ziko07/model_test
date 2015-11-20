class QuestionSet < ActiveRecord::Base
  belongs_to :model_test
  belongs_to :question
end
