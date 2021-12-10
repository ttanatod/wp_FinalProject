class Orderline < ApplicationRecord
  belongs_to :ticket, optional: true
  belongs_to :beverage, optional: true
  belongs_to :order


end
