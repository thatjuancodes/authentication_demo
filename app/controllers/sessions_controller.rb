class SessionsController < ApplicationController
  def magic_link
    user = User.find_by(email: params[:email])
    if user
      user.generate_magic_link_token
      UserMailer.magic_link(user).deliver_now
      flash[:notice] = "Magic link sent to your email."
    else
      flash[:alert] = "Email not found."
    end
    redirect_to root_path
  end

  def login_with_magic_link
    user = User.find_by(magic_link_token: params[:token])
    if user && user.magic_link_token_valid?
      sign_in(user)
      redirect_to root_path, notice: 'Successfully logged in with magic link.'
    else
      redirect_to root_path, alert: 'Invalid or expired magic link.'
    end
  end
end