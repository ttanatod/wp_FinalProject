class MainController < ApplicationController
	include MainConcern

	def main
		@movies = Movie.get_now_showing
		puts @movies
	end

	def show_timetable
		@movie = Movie.find_by(name: params[:name])
		@timetables = Timetable.where(movie: @movie).order('time_start')

	end

	def buy_ticket
		@timetable = Timetable.find(params[:timetable])
		@theater = Theater.find(@timetable.theater_id)
		@row = @theater.row
		@column = @theater.column
	end

end
