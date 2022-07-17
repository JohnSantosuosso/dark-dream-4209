require 'rails_helper'

RSpec.describe "Recipes", type: :feature do
  it 'shows shows the list of recipes with name, complexity, and genre' do
    spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')

    visit '/recipes'

    expect(page).to have_content("Name: Spaghetti")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: Italian")
  end
end