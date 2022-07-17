require 'rails_helper'

RSpec.describe "Recipes", type: :feature do
  it 'shows shows the list of recipes with name, complexity, and genre' do
    spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
    burrito = Recipe.create!(name: 'Burrito', complexity: 3, genre: 'Mexican')

    visit '/recipes'

    expect(page).to have_content("Name: Spaghetti")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: Italian")
    
    expect(page).to have_content("Name: Burrito")
    expect(page).to have_content("Complexity: 3")
    expect(page).to have_content("Genre: Mexican")
  end
end