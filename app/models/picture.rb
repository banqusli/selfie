class Picture < ApplicationRecord
  belongs_to :user
  acts_as_votable
  #Paperclip::Attachment.default_options[:default_url] = "/images/missing.png"
  #Paperclip::Attachment.default_options[:default_url] = "/images/default_image.png"
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
