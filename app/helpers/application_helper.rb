module ApplicationHelper

  def get_notifications
    @get_notifications = Notification.where(receiver: current_user).order(created_at: :desc)
  end

  def create_it(user, receiver, action, status)
    @friend = Friend.create(user_id: user, receiver_id: receiver, action: action, status: status)
    @friend.save
  end
end

