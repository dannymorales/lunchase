class LunchSpecial < ActiveRecord::Base
	acts_as_votable
	has_many :upvoted_users, through: :votes, source: :user
	belongs_to :user
	belongs_to :restaurant
	has_many :ingredients
	# validates :restaurant_id, presence: true
	validates :price, presence: true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode

	

	def self.ransackable_attributes(auth_object = nil)
  		super - ['id', 'image_name', 'image_content_type', 'created_at', 'image_file_size', 'updated_at', 'restaurant_id', 'user_id', 'avatar_file_name', 'avatar_content_type', 'avatar_file_size', 'avatar_updated_at']
	end

end
