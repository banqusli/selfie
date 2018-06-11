class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :receiver, foreign_key: {to_table: :users}
      t.string :action
      t.string :info

      t.timestamps
    end
  end
end
