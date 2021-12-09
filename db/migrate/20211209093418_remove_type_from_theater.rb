class RemoveTypeFromTheater < ActiveRecord::Migration[6.1]
  def change
    remove_column :theaters, :type, :string
  end
end
