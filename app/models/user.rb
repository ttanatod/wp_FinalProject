class User < ApplicationRecord
	validates :username, :email, presence: true, uniqueness: true
	validates :firstname, :lastname, presence: true
	validates :password, presence: true, length: {minimum: 4}
	has_secure_password

	# def get_all_order
	# 	order_ids = Order.where(user: self).pluck('id')
	# 	orders = Array.new
	# 	order_ids.each do |order_id|
	# 		orders.append([order_id, Orderline.where(order: order_id).order('created_at DESC')])
	# 	end
	# 	return orders
	# end

	def get_all_order
		order_ids = Order.where(user: self).order('id DESC').pluck('id')
		orders = Array.new
		order_ids.each do |order_id|
			orderlines = Orderline.where(order: order_id).order('isticket DESC, totalPrice DESC')
			order = Array.new
			orderlines.each do |orderline|
				data = Array.new #name quatity price
				if orderline.isticket
					ticket = Ticket.find(orderline.ticket_id)
					chair = Chair.find(ticket.chair_id)
					movie = Movie.find(Timetable.find(ticket.timetable_id).movie_id)
					name = movie.name + "-" + chair.row + chair.column.to_s
					quantity = 1
					price = chair.price
					data = [name, quantity, price]
				else
					beverage = Beverage.find(orderline.beverage_id)
					name = beverage.name
					quantity = orderline.quantity
					price = orderline.totalPrice
					data = [name, quantity, price]
				end
				order.append(data)
			end
			orders.append([order_id, order])
		end
		return orders
	end

end
