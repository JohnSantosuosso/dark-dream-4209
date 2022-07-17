require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'methods' do
    it 'should return the total cost of all ingredients' do
      charcuterie = Recipe.create!(id: 1, name: 'Charcuterie', complexity: 5, genre: 'Entertainment')
      sourdough = Recipe.create!(id: 2, name: 'Sourdough', complexity: 5, genre: 'Baking')

      ingredient1 = Ingredient.create!(id: 1, name: 'meat', cost: 10)
      ingredient2 = Ingredient.create!(id: 2, name: 'cheese', cost: 20)
      ingredient3 = Ingredient.create!(id: 3, name: 'bread', cost: 30)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 1)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: 1, ingredient_id: 2)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: 2, ingredient_id: 3)
      
      expect(charcuterie.total_cost).to eq(30)
    end

    it 'should alphabetize all recipes by name' do
      charcuterie = Recipe.create!(id: 1, name: 'Charcuterie', complexity: 5, genre: 'Entertainment')
      sourdough = Recipe.create!(id: 2, name: 'Sourdough', complexity: 5, genre: 'Baking')

      expect(Recipe.alphabetize_recipes_by_name).to eq([charcuterie, sourdough])
    end
  end

end
