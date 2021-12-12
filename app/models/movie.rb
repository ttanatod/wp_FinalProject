class Movie < ApplicationRecord
	has_many :timetable

	validates :name, presence: true, uniqueness: true
	validates :duration, :date_in, :date_out, presence: true

	def self.get_now_showing
		#Movie.where(['release > ?', DateTime.now])
		return self.where(['date_out > ?', Date.today]).where(['date_in < ?', Date.today]).order('name')
	end

	def self.get_coming_soon
		return self.where(['date_out > ?', Date.today]).where(['date_in > ?', Date.today]).order('name')
	end
	
	def get_timetable
		timetables = Hash.new
		theater = Theater.all.order('name')
		theater.each do |theater|
			timetable = Timetable.where(theater: theater, movie: self).where(['Date(time_start) = ?', Date.today])
			timetables[theater.name] = timetable
		end
		puts timetables
		return timetables
	end
end