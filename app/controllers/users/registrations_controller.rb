class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @token = params[:invite_token] #<-- pulls the value from the url query string
    @user = User.new
    puts @token
  end

  # POST /resource
  def create
    # puts "CREATING NEW USER NOW"
    @newUser = User.create!(user_params)
    @token = params[:invite_token]
    # p @token
    if @token != nil
       org =  Invite.find_by_token(@token).group_id #find the user group attached to the invite
       @newUser.memberships.create!(group_id: org) # add this user to the new user group as a member
    else
      # do normal registration things #
    end

    redirect_to root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
