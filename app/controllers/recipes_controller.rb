class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alphabetize_recipes_by_name
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end