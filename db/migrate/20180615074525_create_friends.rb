class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.references :receiver, foreign_key: {to_table: :users}
      t.string :action
      t.string :status

      t.timestamps
    end
  end
end
