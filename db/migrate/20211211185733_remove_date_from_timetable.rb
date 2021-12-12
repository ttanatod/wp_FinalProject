class RemoveDateFromTimetable < ActiveRecord::Migration[6.1]
  def change
    remove_column :timetables, :time_start, :time
    remove_column :timetables, :time_stop, :time
  end
end
