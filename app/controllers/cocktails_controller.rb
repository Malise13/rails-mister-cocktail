class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktails = Cocktail.new
  end

  def create
    @cocktails = Cocktail.new(cocktail_params)
    @cocktail.save
  end

  def edit
    @cocktails = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktails = Cocktail.update(cocktail_params)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
