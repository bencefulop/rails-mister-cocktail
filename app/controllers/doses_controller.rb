class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    # @dose.ingredients = Ingredients.find(params[:dose][:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    @dose.save

    redirect_to cocktail_path(@cocktail)

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
