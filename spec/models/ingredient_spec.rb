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

  describe "model methods" do 
    it "#recipe_count" do 
      grilled_cheese = Recipe.create!(name: "Grilled Cheese", complexity: 1, genre: "American")
      cheeseburger = Recipe.create!(name: "Cheese Burger", complexity: 2, genre: "American")
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
    
      cheese = Ingredient.create!(name: "American Cheese", cost: 4)
      bread = Ingredient.create!(name: "Bread", cost: 3)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: grilled_cheese.id, ingredient_id: cheese.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: cheese.id)
      
      expect(cheese.recipe_count).to eq 2
    end 
  end 
end
