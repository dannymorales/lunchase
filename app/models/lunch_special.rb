class LunchSpecial < ActiveRecord::Base
	acts_as_votable
	has_many :upvoted_users, through: :votes, source: :user
	belongs_to :user
	belongs_to :restaurants
	has_many :ingredients
	# validates :restaurant_id, presence: true
	validates :price, presence: true

	

end
