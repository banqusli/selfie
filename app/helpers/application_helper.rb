module ApplicationHelper

  def get_notifications
    @get_notifications = Notification.where(receiver: current_user).order(created_at: :desc)
  end
end

