class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'user roles successfully updated'
    else
      render 'edit'
    end
  end

  def show

  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit({role_ids: []})
  end

end