class MainController < ApplicationController
	include MainConcern

	before_action :set_user, only: %i[ create_order ]

	def main
		@movies = Movie.get_now_showing
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
		gon.timetable = @timetable
		gon.sold_row = @timetable.sold_row
		gon.sold_col = @timetable.sold_col
		gon.row = @row
		gon.col = @column
		gon.chair_type = @theater.get_chair_type
	end


	def post_order_summary
		session[:seat] = params[:seat]
		session[:timetable] = params[:timetable]
		render :js => "window.location = '/ordersummary'"
		puts params[:seat]
		puts session[:seat]
	end

	def order_summary

		session[:user_id] = 1

		@movie = Movie.find(session[:timetable]["movie_id"])
		@theater = Theater.find(session[:timetable]["theater_id"])

		@selected_seat = Array.new
		session[:seat].each do |key, value| # value-> [row, col, type]
			@selected_seat.append( [(value[0].to_i+64).chr + value[1].to_s, value[2] ])
		end
		gon.seat = @selected_seat
		gon.timetable = session[:timetable]
		@total_price = 0
	end

	def create_order
		order = Order.create(user: @user)
		timetable = Timetable.find(session[:timetable]["id"].to_i)
		
		session[:seat].each do |key, value|
			seat = Chair.find_by(row: (value[0].to_i+64).chr, column: value[1].to_i, theater_id: timetable.theater_id)
			ticket = Ticket.create(timetable: timetable, chair: seat)
			Orderline.create(order: order, quantity: 1, ticket: ticket, isticket: true, totalPrice: seat.price)
		end

		session.clear
		session[:user_id] = @user.id
		redirect_to main_path, flash:{success: "buy successfully"}
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

end
