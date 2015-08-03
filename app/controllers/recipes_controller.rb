
class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order(updated_at: :asc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new


  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first

    if @recipe.save
    #   do something
      flash[:success] = "Your Recipe was created successfully"
      redirect_to recipes_path
    else
    #   render template
      render :new
    end

  end

  def edit
    @recipe = Recipe.find(params[:id])

  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "You have Successfully updated your Recipe"
      redirect_to recipe_path(@recipe)
    else
      render :edit

    end


  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description)

    end


end