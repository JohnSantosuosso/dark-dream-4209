require 'rails_helper'

RSpec.describe "Recipe show", type: :feature do
  it 'shows a list of ingredients' do
    recipe_1 = Recipe.create!(id: 1, name: 'Spaghetti', complexity: 2, genre: 'Italian')
    recipe_2 = Recipe.create!(id: 2, name: 'Burrito', complexity: 3, genre: 'Mexican')
    
    ingredient_1= Ingredient.create!(id: 1, name: 'Pasta', cost: 10)
    ingredient_2 = Ingredient.create!(id: 2, name: 'Meat', cost: 20)
    ingredient_3 = Ingredient.create!(id: 3, name: 'Cheese', cost: 15)
    ingredient_4 = Ingredient.create!(id: 4, name: 'Salsa', cost: 5)
    
    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 1)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 2)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 3)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 4)


    visit "/recipes/1"

    expect(page).to have_content("Spaghetti Ingredients")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("Meat")
    expect(page).to have_content("Cheese")
    expect(page).to_not have_content("Salsa")
  end
end