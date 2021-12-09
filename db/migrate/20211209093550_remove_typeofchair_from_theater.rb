class RemoveTypeofchairFromTheater < ActiveRecord::Migration[6.1]
  def change
    remove_column :theaters, :typeofchair, :string
  end
end
