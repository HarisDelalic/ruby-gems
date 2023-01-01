class StaticPagesController < ApplicationController
  def landing_page
    @courses = Course.all
    @most_recent_courses = Course.all.limit(3)
  end

  def privacy_policy
  end
end
