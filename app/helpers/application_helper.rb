module ApplicationHelper

  def user_id?
    @signed_in_user = session[:user_id]
    @user = @signed_in_user.nil? ? @signed_in_user : current_user.id
  end

  def set_user
    @id = current_user.user
    @user = @id.nil? ? current_user : current_user.id
  end
end

