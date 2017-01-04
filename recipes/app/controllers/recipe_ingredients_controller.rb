class RecipeIngredientsController < ApplicationController

  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  def show
  end

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def edit
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
  end

  def update

  end

  def destroy
    @recipe_ingredient.destroy
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:quantity, :ingredient)
  end
end
