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
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.delete
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name, :photo)
  end
end
