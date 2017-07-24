class UserMailer < ApplicationMailer
  default from: 'test@test.com'

  def confirm_account_deletion(user)
    @user = user
    mail(to: @user.email, subject: 'Account deletion confirmation')
  end
end
