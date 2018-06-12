class AddPictureIdToNotification < ActiveRecord::Migration[5.1]
  def change
    add_reference :notifications, :picture, foreign_key: true
  end
end
