class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alphabetize_ingredients_by_name
  end
end