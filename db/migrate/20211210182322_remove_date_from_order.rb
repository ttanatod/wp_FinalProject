class RemoveDateFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :datetime, :datetime
  end
end
