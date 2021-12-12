class Theater < ApplicationRecord
	has_many :chairs

	def get_chair_type
		return Chair.where(theater: self).order('row','column').pluck('typeofchair')
	end

	def check_typeofchair(row, col)
		r = (row+64).chr
		return Chair.find_by(theater: self, row: r, column: col).typeofchair
	end

	def get_chair_detail
		return Chair.distinct.where(theater: self).order('price DESC').pluck('typeofchair, price')
	end
end
