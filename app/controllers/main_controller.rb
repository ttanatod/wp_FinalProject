class MainController < ApplicationController
	include MainConcern

	before_action :set_user, only: %i[ create_order show_my_order]
	before_action :clear_all_session, only: %i[ main show_timetable]

	def main
		@movies = Movie.get_now_showing
	end

	def show_timetable
		@movie = Movie.find_by(name: params[:name])
		@timetables = @movie.get_timetable
		#@timetables = Timetable.where(movie: @movie).order('time_start')
	end

	def buy_ticket
		@timetable = Timetable.find(params[:timetable])
		session[:timetable_id] = @timetable.id
		@movie_name = Movie.find(@timetable.movie_id).name
		session[:timetable] = params[:timetable]
		@theater = Theater.find(@timetable.theater_id)
		puts "--------------------------"
		puts @theater.name
		@row = @theater.row
		@column = @theater.column
		gon.timetable = @timetable
		gon.sold_row = @timetable.sold_row
		gon.sold_col = @timetable.sold_col
		gon.row = @row
		gon.col = @column
		gon.chair_type = @theater.get_chair_type

		gon.seat = nil
		if session[:seat] != nil
			gon.seat = session[:seat]
		end
	end


	def post_add_ticket
		session[:seat] = params[:seat]
		session[:timetable] = params[:timetable]
		redirect_to buybeverage_path
		# render :js => "window.location = '/ordersummary'"
		# puts params[:seat]
		# puts session[:seat]
	end

	def order_summary
		puts session[:beverage]
		session[:user_id] = 1

		@movie = Movie.find(session[:timetable]["movie_id"])
		@theater = Theater.find(session[:timetable]["theater_id"])

		@selected_seat = Array.new

		if session[:seat] != nil
			session[:seat].each do |key, value| # value-> [row, col, type]
				@selected_seat.append( [(value[0].to_i+64).chr + value[1].to_s, value[2] ])
			end
		end

		gon.seat = @selected_seat
		gon.beverage = session[:beverage]
		gon.timetable = session[:timetable]
		@total_price = 0
	end

	def create_order
		if session[:seat] == nil and session[:beverage] == nil
			redirect_to main_path, flash:{notice: "please select seat or beverage"}
		end

		order = Order.create(user: @user)
		timetable = Timetable.find(session[:timetable]["id"].to_i)
		
		if session[:seat] != nil
			session[:seat].each do |key, value|
				seat = Chair.find_by(row: (value[0].to_i+64).chr, column: value[1].to_i, theater_id: timetable.theater_id)
				ticket = Ticket.create(timetable: timetable, chair: seat)
				Orderline.create(order: order, quantity: 1, ticket: ticket, isticket: true, totalPrice: seat.price)
			end
		end

		if session[:beverage] != nil
			session[:beverage].each do |key, value|
				beverage = Beverage.find_by(name: value[0])
				Orderline.create(order: order, quantity: value[1].to_i, beverage: beverage, isticket: false, totalPrice: value[1].to_i*value[2].to_i)
			end
		end

		redirect_to main_path, flash:{success: "buy successfully"}
	end

	def buy_beverage
		@beverages = Beverage.all
		gon.beverages = @beverages
	end

	def post_add_beverage
		session[:beverage] = params[:beverage]
		redirect_to ordersummary_path
	end

	def show_my_order
		@orders = @user.get_all_order
		puts @orders

	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	if session[:user_id] != nil 
	      @user = User.find(session[:user_id])
	    else 
	    	redirect_to login_path, flash:{alert: "Please login"}
	    end
    end

    def clear_all_session
    	id = session[:user_id]
    	f = flash
    	session.clear
			session[:user_id] = id
			flash = f
    end


end
