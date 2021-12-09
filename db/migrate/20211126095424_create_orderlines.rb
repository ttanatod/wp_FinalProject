class CreateOrderlines < ActiveRecord::Migration[6.1]
  def change
    create_table :orderlines do |t|
      t.references :Product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :totalPrice
      t.integer :quantity

      t.timestamps
    end
  end
end
