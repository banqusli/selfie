class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :warning, :danger, :info
  protected

  def configure_permitted_parameters
    attributes = [:name, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def control_users!
    if @picture.user_id != current_user.id
        redirect_to error_url, warning: 'you dont have permission for it'
    end
  end

  def query_filter(objects)
    if user_signed_in?
      filted = objects.where(:user_id => current_user.id)
    end
    return filted
  end

  def set_notifications
      User.all.each do |user|
        @notification = Notification.create(user: current_user, receiver: user, action: 'post', info: 'posted a Picture')
        @notification.save
      end
  end
end
