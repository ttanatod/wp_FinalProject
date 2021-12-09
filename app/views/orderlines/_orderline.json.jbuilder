json.extract! orderline, :id, :Product_id, :order_id, :totalPrice, :quantity, :created_at, :updated_at
json.url orderline_url(orderline, format: :json)
