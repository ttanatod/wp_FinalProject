class DropTabletickets < ActiveRecord::Migration[6.1]
  def change
      drop_table :tickets
  end
end
