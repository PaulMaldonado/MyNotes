class UsuariosController < ApplicationController
  before_action :find_user

  def show

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :bio, :url)
  end
end