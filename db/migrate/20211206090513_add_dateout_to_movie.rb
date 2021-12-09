class AddDateoutToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :date_out, :date
  end
end
