class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
