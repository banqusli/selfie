class AddMsgToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :msg, :string
  end
end
