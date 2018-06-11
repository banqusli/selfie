json.extract! notification, :id, :user_id, :receiver_id, :action, :info, :created_at, :updated_at
json.url notification_url(notification, format: :json)
