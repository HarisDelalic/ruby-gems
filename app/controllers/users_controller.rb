class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

end