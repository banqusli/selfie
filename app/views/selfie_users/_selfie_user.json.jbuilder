json.extract! selfie_user, :id, :name, :email, :user_id, :created_at, :updated_at
json.url selfie_user_url(selfie_user, format: :json)
