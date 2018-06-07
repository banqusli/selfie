class Picture < ApplicationRecord
  belongs_to :user
  acts_as_votable
  acts_as_commontable dependent: :destroy
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
