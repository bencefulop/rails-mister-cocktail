require 'json'
require 'open-uri'

puts "Cleaning database"

Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts "creating a 100 ingredients"
n = 0
100.times do
  new_ingredient = Ingredient.new(
    name: ingredient["drinks"][n]["strIngredient1"],
  )
  new_ingredient.save
  n += 1
end

puts "100 ingredients created"