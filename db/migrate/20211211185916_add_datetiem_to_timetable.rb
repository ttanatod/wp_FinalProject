class AddDatetiemToTimetable < ActiveRecord::Migration[6.1]
  def change
    add_column :timetables, :time_start, :datetime
    add_column :timetables, :time_stop, :datetime
  end
end
