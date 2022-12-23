class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.all
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
    redirect_to user_food_path(current_user.id)
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.public_recipe == true
      @recipe.update(public_recipe: false)
    else
      Recipe.find(@recipe.id).update(public_recipe: true)
    end
    redirect_to user_recipe_path(@recipe.id), notice: 'Public Updated'
  end

  def create
    @recipes = Recipe.all
    @recipe = Recipe.new(
      name: recipe_params[:name],
      preparation_time: recipe_params[:preparation_time],
      cooking_time: recipe_params[:cooking_time],
      description: recipe_params[:description],
      public_recipe: recipe_params[:public_recipe],
      user_id: current_user.id
    )

    if @recipe.valid?
      @recipe.save
      flash[:success] = 'Recipe added'
      redirect_to user_recipe_path(current_user.id, @recipe.id)
    else
      flash.now[:error] = 'Recipe Not Added'
      render 'new'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    redirect_to user_recipe_path(current_user.id)
    if current_user == recipe.user
      recipe.destroy
    else
      flash[:danger] = 'Sorry, something went wrong!'
    end
  end

  def public
    @recipes = Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public_recipe)
  end
end
