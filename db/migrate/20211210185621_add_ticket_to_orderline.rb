class AddTicketToOrderline < ActiveRecord::Migration[6.1]
  def change
    add_reference :orderlines, :ticket, null: true, foreign_key: true
    add_reference :orderlines, :beverage, null: true, foreign_key: true
    add_column :orderlines, :isticket, :boolean
  end
end
