class DeleteColumnsInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email
    remove_column :users, :password
  end
end
