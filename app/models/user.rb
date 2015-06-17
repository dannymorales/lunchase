class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,

  devise :database_authenticatable, :omniauthable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  		
	
	# def self.from_omniauth(auth)
	#     user = where(email: auth.info.email).first || where(auth.slice(:provider, :uid)).first || new
	#     user.update_attributes provider: auth.provider,
	#                            uid:      auth.uid,
	#                            email:    auth.info.email
	#     user.name ||= auth.info.name # note: Devise seems to wrap this in the DB write for session info
	#     user
	# end
	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.image = auth.info.image # assuming the user model has an image
  		end
	end
	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params 
				user.valid?
			end
		else
			super
		end
	end

	def password_required?
		super && provider.blank?
	end

	def update_with_password(params, *options)
		if encrypted_password.blank?
			update_attributes(params, *options)
		else
			super
		end
	end

	def self.find_by_email(email)
  		User.where("lower(email) = ?", email.downcase).first
	end

	def self.find_by_username(username)
  		User.where("lower(username) = ?", username.downcase).first
	end

end
