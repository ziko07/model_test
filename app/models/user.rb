class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :model_tests
  has_many :payments

  def rejected_payments
    payments.where(:is_rejected => true)
  end

  def pending_payments
    payments.where(:is_approved => false, :is_rejected => false)
  end

  def approved_payments
    payments.where(:is_approved => true)
  end

end
