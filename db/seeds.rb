require 'json'
require 'open-uri'

puts "Cleaning database"

Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

puts "Database cleaned"

puts "creating a 100 ingredients"

ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(ingredient_url).read)


ingredients["drinks"].each do |ingredient|
Ingredient.create!(name: ingredient["strIngredient1"])
end


puts "100 ingredients created"

puts "Creating cocktails"

cocktail_url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
cocktails = JSON.parse(open(cocktail_url).read)

n = 0

while n < 16 do
  Cocktail.create!( name: cocktails[n]["name"])
  n += 1
end

puts "Cocktails created"