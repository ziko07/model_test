class UserMailer < ApplicationMailer
  default from: "mahabubziko@example.com"
  def result_mail(user)
    @user = user
    mail(to: 'zikoku07@gmail.com', subject: 'Sample Email')
  end

end
