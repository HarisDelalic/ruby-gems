class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include PublicActivity::StoreController

  before_action :authenticate_user!
  before_action :set_global_variables, if: :user_signed_in?

  after_action :update_online_status!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end

  def update_online_status!
    current_user.try :touch
  end
end
