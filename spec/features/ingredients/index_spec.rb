require 'rails_helper'

RSpec.describe "Ingredient index", type: :feature do
  it 'shows a list of ingredients and the number of recipes they are used in' do
    recipe_1 = Recipe.create!(id: 1, name: 'Spaghetti', complexity: 2, genre: 'Italian')
    recipe_2 = Recipe.create!(id: 2, name: 'Burrito', complexity: 3, genre: 'Mexican')
    
    ingredient_1= Ingredient.create!(id: 1, name: 'Pasta', cost: 10)
    ingredient_2 = Ingredient.create!(id: 2, name: 'Meat', cost: 20)
    ingredient_3 = Ingredient.create!(id: 3, name: 'Cheese', cost: 15)
    ingredient_4 = Ingredient.create!(id: 4, name: 'Salsa', cost: 5)
    ingredient_5 = Ingredient.create!(id: 5, name: 'Tomatoes', cost: 5)
    
    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 1)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 2)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 3)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 4)
    recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 5)
    recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 5)
    recipe_ingredient_7 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 2)
    recipe_ingredient_7 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 3)


    visit '/ingredients'

    expect(page).to have_content("Pasta: 1")
    expect(page).to have_content("Meat: 2")
    expect(page).to have_content("Cheese: 2")
    expect(page).to have_content("Salsa: 1")
    expect(page).to have_content("Tomatoes: 2")
  end

end 