class SessionsController < ApplicationController

  def create
    @user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    p session[:fb_token]
    p session[:user_id]
    p "I am here!"
    # session[:user_id] = nil
    session.destroy
    # p session
    p session[:fb_token]
    p session[:user_id]
    redirect_to root_url
  end
end
