class Location < ActiveRecord::Base
	reverse_geocoded_by :latitude, :longitude do |obj,results|
  if geo = results.first
    obj.address = geo.address
  end
end

after_validation :reverse_geocode

end
