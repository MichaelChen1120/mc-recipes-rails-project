class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_recipe, only: [:new, :create]
  before_action :set_logged_in?
  before_action :set_current_user
  # GET /reviews
  # GET /reviews.json
  def index
    if params[:user_id]
      @reviews = @user.reviews
      render :user_index
    else
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @reviews = @recipe.reviews
      render :recipe_index
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new(user_id: params[:user_id], recipe_id: params[:recipe_id])
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create

    @review = @current_user.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to user_review_path(@current_user.id, @review), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to user_review_path(@current_user.id, @review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to user_reviews_path(@current_user), notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logged_in?
      redirect_to root_path if !logged_in?
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def set_recipe
      @recipe = Recipe.find_by(:user_id => params[:user_id], :id => params[:id])
    end

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_current_user
      @current_user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :recipe_id)
    end
end
