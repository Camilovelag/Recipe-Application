# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.first

food1 = Food.create!(name: "Pizza", price: 5, unit: 'grams')
food2 = Food.create!(name: "Hamburger", price: 4, unit: 'grams')
food3 = Food.create!(name: "Salad", price: 3, unit: 'grams')


recipe1 = Recipe.create!(name: "Pizza Recipe", description: "1. Preheat oven to 450°F (230°C).
2. Roll out pizza dough on a floured surface.
3. Spread sauce evenly over the dough.
4. Add cheese and toppings of your choice.
5. Bake in the oven for 12-15 minutes or until the crust is golden brown.
6. Enjoy your delicious pizza!", preparation_time: '1h', cooking_time: '40mnt', public: true, user_id: user.id)

recipe2 = Recipe.create!(name: "Hamburger Recipe", description: "1. Preheat grill to high heat.
2. Form ground beef into patties.
3. Season patties with salt and pepper.
4. Place patties on the grill and cook for 4-5 minutes on each side or until fully cooked.
5. Toast buns on the grill.
6. Assemble burgers with condiments and toppings of your choice.
7. Enjoy your delicious hamburger!", preparation_time: '20mnt', cooking_time: '20mnt', public: true, user_id: user.id)

recipe3 = Recipe.create!(name: "Salad Recipe", description: "1. Wash and chop greens and other ingredients.
2. In a large bowl, mix together the greens, ingredients, and dressing of your choice.
3. Serve and enjoy your healthy salad!", preparation_time: '40mnt', cooking_time: '0', public: true, user_id: user.id)


inventory1 = Inventory.create!(name: "My Fridge", user_id: user.id)
inventory2 = Inventory.create!(name: "Pantry", user_id: user.id)
inventory3 = Inventory.create!(name: "Food Storage", user_id: user.id)


InventoryFood.create!(quantity: 5, food_id: food1.id, inventory_id: inventory1.id)
InventoryFood.create!(quantity: 3, food_id: food2.id, inventory_id: inventory1.id)
InventoryFood.create!(quantity: 2, food_id: food3.id, inventory_id: inventory1.id)

RecipeFood.create!(quantity: 2, food_id: food1.id, recipe_id: recipe1.id)
RecipeFood.create!(quantity: 1, food_id: food2.id, recipe_id: recipe1.id)
RecipeFood.create!(quantity: 3, food_id: food3.id, recipe_id: recipe1.id)