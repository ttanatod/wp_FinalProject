class Orderline < ApplicationRecord
  belongs_to :Product
  belongs_to :order
end
