class Movie < ApplicationRecord
	has_many :timetable

	validates :name, presence: true, uniqueness: true
	validates :duration, :date_in, :date_out, presence: true

	def self.get_now_showing
		Movie.where(['release > ?', DateTime.now])
		return self.where(['date_out > ?', Date.today]).order('date_out')
	end

	def get_timetable
		timetables = Hash.new
		theater = Theater.all.order('name')
		theater.each do |theater|
			timetable = Timetable.where(theater: theater, movie: self)
			timetables[theater.name] = timetable
		end
		puts timetables
		return timetables
	end
end
