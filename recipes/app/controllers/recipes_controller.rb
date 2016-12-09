class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :edit, :show, :destroy]
  before_action :set_ingredients, only: [:new]
  before_action :set_current_user
  before_action :set_logged_in?
  # GET /recipes
  # GET /recipes.json
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @recipes = @user.recipes
    else
      @recipes = Recipe.all
      render :allrecipes
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = @user.recipes.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new(:user => @user)
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = @user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipe_path(@user.id, @recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to user_recipe_path(@user.id, @recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_recipes_path(@user), notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logged_in?
      redirect_to root_path if !logged_in?
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_ingredients
      @ingredients = Ingredient.all
    end

    def set_current_user
      @current_user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :user_id, :ingredient_ids => [])
    end
end
