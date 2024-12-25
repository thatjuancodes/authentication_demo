class UserMailer < ApplicationMailer
  def magic_link(user)
    @user = user
    mail(to: @user.email, subject: 'Your Magic Link')
  end
end
