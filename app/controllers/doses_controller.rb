class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @doses = Dose.new
  end

  def create
    @doses = Dose.new(dose_params)
    @dose.save
  end

  def edit
    @doses = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @doses = Dose.update(dose_params)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:name)
  end
end
