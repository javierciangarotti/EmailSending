class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def index
    super
    @users = User.all
    Rails.logger.debug("****** Pasando por Index ********")
  end

  def show
    @user = user.find(params[:id])
    Rails.logger.debug("****** Pasando por Show ********")
  end

  def new
    super
    Rails.logger.debug("****** Pasando por CREATE XXXXXX ********")
  end


  def create
    super
    @user = User.find(current_user)
    Rails.logger.debug("****** Pasando por CREATE YYYYYY ********")
  end

  def update
    Rails.logger.debug("****** Pasando por update ********")
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to root_path, notice => 'no problems'
    else
      redirect_to root_path, notice => 'something went wrong'
    end
  end

  private

  def secure_params
    params.requiere(:user).permit(:role)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :document, :dob, :phone_number, :balance, :password, :password_confirmation)

  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :document, :dob, :phone_number, :balance, :password, :password_confirmation, :current_password)
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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
end
