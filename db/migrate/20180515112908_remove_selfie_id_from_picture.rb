class RemoveSelfieIdFromPicture < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :selfie_user_id
  end
end
