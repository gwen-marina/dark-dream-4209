require 'rails_helper'

RSpec.describe 'recipes index page' do 
  
  it 'has the name, complexity, and genre for each recipe' do 
    grilled_cheese = Recipe.create!(name: "Grilled Cheese", complexity: 1, genre: "American")
    hamburger = Recipe.create!(name: "Hamburger", complexity: 2, genre: "American")
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")

    cheese = Ingredient.create!(name: "American Cheese", cost: 4)
    bread = Ingredient.create!(name: "Bread", cost: 3)
    butter = Ingredient.create!(name: "Butter", cost: 2)
    meat = Ingredient.create!(name: "Meat", cost: 7)

     visit '/recipes'

     within "#recipes-#{grilled_cheese.id}" do 
      expect(page).to have_content("Name: Grilled Cheese")
      expect(page).to have_content("Complexity: 1")
      expect(page).to have_content("Genre: American")
     end

      within "#recipes-#{hamburger.id}" do 
      expect(page).to have_content("Name: Hamburger")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: American")
     end

      within "#recipes-#{spaghetti.id}" do 
      expect(page).to have_content("Name: Spaghetti")
      expect(page).to have_content("Complexity: 3")
      expect(page).to have_content("Genre: Italian")
     end
  end
end