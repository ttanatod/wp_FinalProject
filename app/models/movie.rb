class Movie < ApplicationRecord
	has_many :timetable

	validates :name, presence: true, uniqueness: true
	validates :duration, :date_in, :date_out, presence: true

	def self.get_now_showing
		Movie.where(['release > ?', DateTime.now])
		return self.where(['date_out > ?', Date.today]).order('date_out')
	end
end
