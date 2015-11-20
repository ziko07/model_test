class Subject < ActiveRecord::Base
  belongs_to :exam
  has_many :questions, :dependent => :destroy
  has_many :model_tests
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
