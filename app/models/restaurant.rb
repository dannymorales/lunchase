class Restaurant < ActiveRecord::Base
	has_many :lunch_specials
	validates :name, presence: true
	validates :address, presence: true
	validates :address, uniqueness: true
	validates :state, presence: true
	geocoded_by :full_address
	after_validation :geocode

	def full_address
		[address, city, state].compact.join(', ')
	end
end
