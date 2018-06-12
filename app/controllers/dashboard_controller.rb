class DashboardController < ApplicationController
  def index
    @picture = query_filter(Picture.all)
  end

  def error
  end
end
