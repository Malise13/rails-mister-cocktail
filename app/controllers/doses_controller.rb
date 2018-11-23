class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create]
  def index
    @doses = Dose.all
  end

  def show
    @set_dose
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.new(cocktail: @cocktail, ingredient: Ingredient.new)
  end

  def create
    @doses = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @set_dose
  end

  def update
    @doses = Dose.update(dose_params)
    redirect_to dose_path(@dose)
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
