class RemoveProductFromOrderline < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orderlines, :Product, null: false, foreign_key: true
  end
end
