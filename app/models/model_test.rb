class ModelTest < ActiveRecord::Base
  has_many :question_sets
  has_many :questions, through: :question_sets
  belongs_to :subject
end
