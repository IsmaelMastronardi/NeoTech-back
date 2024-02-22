class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.float :total_price, default: 0.0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
