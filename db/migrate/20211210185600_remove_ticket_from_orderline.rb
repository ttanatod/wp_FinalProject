class RemoveTicketFromOrderline < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orderlines, :ticket, null: false, foreign_key: true
    remove_reference :orderlines, :beverage, null: false, foreign_key: true
    remove_column :orderlines, :isticket, :boolean
  end
end
