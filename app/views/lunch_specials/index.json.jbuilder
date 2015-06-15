json.array!(@lunch_specials) do |lunch_special|
  json.extract! lunch_special, :id, :title, :description, :restaurant, :address, :city, :state, :zip_code, :image_name, :image_content_type, :image_file_size, :price, :calories
  json.url lunch_special_url(lunch_special, format: :json)
end
