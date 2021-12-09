class Ticket < Product
  belongs_to :timetable
  belongs_to :Chair
end
