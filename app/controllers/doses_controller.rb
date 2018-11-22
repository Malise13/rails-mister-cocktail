class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @doses = Dose.new
  end

  def create
    @doses = Dose.new(dose_params)
    @dose.save
    redirect_to dose_path(@dose)
  end

  def edit
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
    params.require(:dose).permit(:name)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
