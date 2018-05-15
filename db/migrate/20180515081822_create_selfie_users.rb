class CreateSelfieUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :selfie_users do |t|
      t.string :name
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
