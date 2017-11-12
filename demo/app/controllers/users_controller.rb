class UsersController < ApplicationController
  def index
    @users = User.all
    Rails.logger.debug("****** Pasando por Index ********")
  end

  def show
    @user = user.find(params[:id])
  end

  def new
    super
    Rails.logger.debug("****** Pasando por CREATE ********")
  end


  def create
    super
    Rails.logger.debug("****** Pasando por CREATE ********")
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

end
