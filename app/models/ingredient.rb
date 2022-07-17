class Ingredient < ApplicationRecord
  validates_presence_of :name, :cost

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def recipes_used_in
    self.recipes.count
  end

  def self.alphabetize_ingredients_by_name
    order(name: :asc)
  end

end