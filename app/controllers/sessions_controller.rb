class SessionsController < ApplicationController
  def magic_link
    # Logic to handle sending the magic link
    # For example:
    user = User.find_by(email: params[:email])
    if user
      # Send magic link to the user's email
      UserMailer.magic_link(user).deliver_now
      flash[:notice] = "Magic link sent to your email."
    else
      flash[:alert] = "Email not found."
    end
    redirect_to root_path
  end
end