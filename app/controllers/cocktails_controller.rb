class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @set_cocktail
  end

  def new
    @cocktails = Cocktail.new
  end

  def create
    @cocktails = Cocktail.new(cocktail_params)
    if @cocktail.save
    redirect_to cocktail_path(@cocktail)
    else
    render :new
    end
  end

  def edit
    @set_cocktail
  end

  def update
    @cocktails = Cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
