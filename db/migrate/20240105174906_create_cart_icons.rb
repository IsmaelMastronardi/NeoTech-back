class CreateCartIcons < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_icons do |t|
      t.integer :quantity
      t.references :cart, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
