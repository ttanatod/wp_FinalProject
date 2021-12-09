class RemoveStatusFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :status, :boolean
  end
end
