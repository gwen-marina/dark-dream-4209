require 'rails_helper'

RSpec.describe 'ingredients index page' do 

  it 'can list all the ingredients and the number of recipes each ingredient is used in' do 
    grilled_cheese = Recipe.create!(name: "Grilled Cheese", complexity: 1, genre: "American")
    cheeseburger = Recipe.create!(name: "Cheese Burger", complexity: 2, genre: "American")
    
    cheese = Ingredient.create!(name: "American Cheese", cost: 4)
    bread = Ingredient.create!(name: "Bread", cost: 3)
    butter = Ingredient.create!(name: "Butter", cost: 2)
    meat = Ingredient.create!(name: "Meat", cost: 7)
 
    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: cheese.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: bread.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: butter.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: meat.id)
    recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: bread.id)
    recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: cheese.id)
  
    visit '/ingredients'

    within "#ingredients-#{cheese.id}" do 
      expect(page).to have_content("American Cheese: 2")  
    end

    within "#ingredients-#{bread.id}" do 
      expect(page).to have_content("Bread: 2")  
    end

    within "#ingredients-#{butter.id}" do 
      expect(page).to have_content("Butter: 1")  
    end

    within "#ingredients-#{meat.id}" do 
      expect(page).to have_content("Meat: 1")  
    end
  end
end