class AddCompletedToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :completed, :boolean, default: false
  end
end
