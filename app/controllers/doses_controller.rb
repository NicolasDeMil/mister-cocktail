class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
