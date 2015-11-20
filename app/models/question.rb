class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answers, :dependent => :destroy
  has_many :question_sets
  has_many :model_tests, through: :question_sets
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:title].blank? }#, :allow_destroy => true

end
