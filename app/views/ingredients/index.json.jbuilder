json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :ingredients, :lunch_special_id
  json.url ingredient_url(ingredient, format: :json)
end
