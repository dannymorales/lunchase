class LunchSpecial < ActiveRecord::Base
	acts_as_votable
	has_many :upvoted_users, through: :votes, source: :user
	belongs_to :user
	belongs_to :restaurants
	has_many :ingredients
	# validates :restaurant_id, presence: true
	validates :price, presence: true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	

end
