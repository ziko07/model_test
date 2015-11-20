class Admin::PaymentsController < ApplicationController
  def index
  @payments = Payment.all
  end

  def payment_approval
    payment = Payment.find_by_id(params[:payment_id])
    if params[:status] == 'approve'
      payment.is_approved = true
      payment.save
    else
      payment.is_rejected = true
      payment.save
    end
   redirect_to admin_user_payments_path
  end
end