class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
  	@id = params[:id]
  	@cocktail = Cocktail.find(@id)
  end

  def new
  	@cocktail = Cocktail.new
  end

  def create
  	@cocktail = Cocktail.new(cocktail_params)
  	@cocktail.save
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name)
  end
end
