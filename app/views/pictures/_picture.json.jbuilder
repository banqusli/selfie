json.extract! picture, :id, :title, :description, :selfie_user_id, :created_at, :updated_at
json.url picture_url(picture, format: :json)
