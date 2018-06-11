class DashboardController < ApplicationController
  def index
    @picture = query_filter(Picture.all)
    @pictures = @pictures&.order(created_at: :desc)
  end

  def error
  end
end
