class SelfieUser < ApplicationRecord
  belongs_to :user
  has_many :pictures
end
