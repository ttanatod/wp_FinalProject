json.extract! ticket, :id, :timetable_id, :Chair_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
