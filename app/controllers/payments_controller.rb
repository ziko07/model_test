class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      redirect_to root_path
    else
      render action: new
    end
  end

  def remove_rejected_payment
   @payments = Payment.all.where(user_id: params[:user_id],is_rejected: true)
   if @payments.present?
     @payments.each do |payment|
       payment.delete
     end
   end
  end

  def payment_list
    @payment_list = current_user.payments
  end

 private
  def payment_params
    params.require(:payment).permit!
  end
end
