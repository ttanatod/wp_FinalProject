class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :tickets
end
