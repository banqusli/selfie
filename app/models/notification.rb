class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: 'User'
  belongs_to :picture
end
