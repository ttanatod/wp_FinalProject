class CreateChairs < ActiveRecord::Migration[6.1]
  def change
    create_table :chairs do |t|
      t.string :type
      t.string :column
      t.string :row
      t.integer :price
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
