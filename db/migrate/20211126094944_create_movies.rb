class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :type
      t.date :date_in
      t.time :date_out
      t.integer :duration

      t.timestamps
    end
  end
end
