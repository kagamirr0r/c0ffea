class RecipesController < ApplicationController
	before_action :set_recipe, only: [:show,:edit,:update,:destroy]

  def index
    @recipes = Recipe.all
  end

	def show
  end

	def new
		@bean = Bean.find_by(id: params[:id])
    @recipe = Recipe.new
    @recipe.build_taste
  end

	def edit
		@bean = Bean.find_by(id: @recipe.bean_id)
	end

  def create
		@recipe = Recipe.new(recipe_params)
    @recipe.save!
    redirect_to recipes_path, notice: 'Created new Recipe!'
  rescue
    render :new
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to my_pages_show_path, notice: 'Edited Recipe!'
  rescue
    render action: 'edit'
  end

  def destroy; end

	private

	def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
	end

  def recipe_params
    params.require(:recipe).permit(:user_id,:bean_id, :name, :grind, :temperature, :amount, :extraction, :r_image,
		taste_attributes: [:id, :recipe_id, :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, :t_comment])
  end
end
