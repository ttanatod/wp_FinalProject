class RemoveTypeFromChair < ActiveRecord::Migration[6.1]
  def change
    remove_column :chairs, :type, :string
  end
end
