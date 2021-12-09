class AddRowToTheater < ActiveRecord::Migration[6.1]
  def change
    add_column :theaters, :row, :integer
    add_column :theaters, :column, :integer
  end
end
