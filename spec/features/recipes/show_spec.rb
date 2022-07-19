require 'rails_helper'

RSpec.describe 'recipes show page' do 

# User Story 2 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see a list of the names of the ingredients the recipe has.
# (e.g. "Pasta, Meat, Cheese")
# spaghetti = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")

  it 'can list all the names of an ingredient a recipe has' do 
    grilled_cheese = Recipe.create!(name: "Grilled Cheese", complexity: 1, genre: "American")
    hamburger = Recipe.create!(name: "Hamburger", complexity: 2, genre: "American")
    
    cheese = Ingredient.create!(name: "American Cheese", cost: 4)
    bread = Ingredient.create!(name: "Bread", cost: 3)
    butter = Ingredient.create!(name: "Butter", cost: 2)
    meat = Ingredient.create!(name: "Meat", cost: 7)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: cheese.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: bread.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: butter.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: hamburger.id, ingredient_id: meat.id)

    visit "/recipes/#{grilled_cheese.id}"

    expect(page).to have_content('American Cheese')
    expect(page).to have_content('Bread')
    expect(page).to have_content('Butter')
    expect(page).to_not have_content('Meat')
  end
end