class AddTypeofchairToTheater < ActiveRecord::Migration[6.1]
  def change
    add_column :theaters, :typeofchair, :string
  end
end
