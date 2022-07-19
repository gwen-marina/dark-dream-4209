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

  describe 'model methods' do 
    it '#total_cost'do 
      cheeseburger = Recipe.create!(name: "Cheese Burger", complexity: 2, genre: "American")
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")

      cheese = Ingredient.create!(name: "American Cheese", cost: 4)
      bread = Ingredient.create!(name: "Bread", cost: 3)
      pasta = Ingredient.create!(name: "Pasta", cost: 2)
      meat = Ingredient.create!(name: "Meat", cost: 7)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: cheese.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: bread.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: cheeseburger.id, ingredient_id: meat.id)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
      recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)

      expect(cheeseburger.total_cost).to eq(14)
      expect(spaghetti.total_cost).to eq(9)

    end
  end
end
