class PasswordResetsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
		user.send_password_reset if user
		flash[:success] = "Success! An email has been sent with password reset instructions."
		redirect_to :root
	end

	def edit
		@user = User.find_by_password_reset_token!(params[:id])
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_sent_at < 2.hours.ago
			redirect_to new_password_reset_path, :alert => "Password reset has expired."
		elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation).merge(password_reset_token: nil, password_reset_sent_at: nil))
			redirect_to root_url, :notice => "Password has been reset!"
		else
			render :edit
		end
	end

end
