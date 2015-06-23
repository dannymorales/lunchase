class Restaurant < ActiveRecord::Base
	has_many :lunch_specials
	validates :name, presence: true
	validates :address, presence: true
	# validate_uniqueness_of :restaurant_address
	validates :state, presence: true

end
