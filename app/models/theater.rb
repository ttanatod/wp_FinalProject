class Theater < ApplicationRecord
	has_many :chairs

	def get_chair_type
		return Chair.where(theater: self).order('row','column').pluck('typeofchair')
	end
end
