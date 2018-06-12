module ApplicationHelper

  def get_notifications
    @get_notifications = Notification.where(receiver: current_user)
    #return @get_notifications
  end
end

