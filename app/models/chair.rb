class Chair < ApplicationRecord
  belongs_to :theater

  def self.get_price(theater, typeofchair)
    return self.find_by(typeofchair: typeofchair, theater: theater).price
  end
  
end
