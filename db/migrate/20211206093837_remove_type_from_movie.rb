class RemoveTypeFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :type, :string
  end
end
