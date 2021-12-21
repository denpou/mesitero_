class FavoritesController < ApplicationController
  
  def create
    resipi = Resipi.find(params[:resipi_id])
    favorite = current_user.favorites.new(resipi_id: resipi.id)
    favorite.save
    redirect_to resipi_path(resipi)
  end

  def destroy
    resipi = Resipi.find(params[:resipi_id])
    favorite = current_user.favorites.find_by(resipi_id: resipi.id)
    favorite.destroy
    redirect_to resipi_path(resipi)
  end
  
end
