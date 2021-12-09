class AddTypeofchairToChair < ActiveRecord::Migration[6.1]
  def change
    add_column :chairs, :typeofchair, :string
  end
end
