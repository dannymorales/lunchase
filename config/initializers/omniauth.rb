Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "not for you", "not for you"
  # provider :facebook, "not for you", "not for you"
end
