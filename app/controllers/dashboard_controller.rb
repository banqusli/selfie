class DashboardController < ApplicationController
  def index
    @picture = query_filter(Picture.all)
    #@pictures = @picture.where(:user_id == current_user.id)
  end

  def error
  end
end
