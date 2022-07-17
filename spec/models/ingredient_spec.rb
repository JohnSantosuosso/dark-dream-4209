require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'methods' do
    it 'should return the total cost of all ingredients' do
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

    expect(ingredient_1.recipes_used_in).to eq(1)
    expect(ingredient_2.recipes_used_in).to eq(2)
    expect(ingredient_3.recipes_used_in).to eq(2)
    expect(ingredient_4.recipes_used_in).to eq(1)
    expect(ingredient_5.recipes_used_in).to eq(2)
    end
  end

  it 'should alphabetize all ingredients by name' do
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

    expect(Ingredient.alphabetize_ingredients_by_name).to eq([ingredient_3, ingredient_2, ingredient_1, ingredient_4, ingredient_5])
  end
  
end
