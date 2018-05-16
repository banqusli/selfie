class DeleteUserIdFormPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :user_id
  end
end
