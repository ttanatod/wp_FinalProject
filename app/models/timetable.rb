class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :tickets

  def sold_row
    ids = sold_chair
    return Chair.find(ids).pluck('row')
  end

  def sold_col
    ids = sold_chair
    return Chair.find(ids).pluck('column')
  end

  def sold_chair
    return self.tickets.pluck('chair_id')
  end
end
