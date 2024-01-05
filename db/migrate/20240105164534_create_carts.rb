class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.decimal :total_price, default: 0.0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
