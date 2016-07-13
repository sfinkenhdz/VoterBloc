class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Sends email to user when user is created.
        ExampleMailer.sample_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # check what the 'new user' form calls the 'password' field (probably not password_digest)
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :full_address, :voter_registration_status, :provider, :uid, :name, :image, :token, :expires_at)
  end

end