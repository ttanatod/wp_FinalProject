class RemoveDateoutFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :date_out, :time
  end
end
