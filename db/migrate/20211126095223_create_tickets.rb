class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :timetable, null: false, foreign_key: true
      t.references :Chair, null: false, foreign_key: true

      t.timestamps
    end
  end
end
