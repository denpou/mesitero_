class ResipisController < ApplicationController
  
  def new
    @resipi = Resipi.new
  end

  def create
    @resipi = Resipi.new(resipi_params)
    @resipi.user_id = current_user.id
    @resipi.save
    redirect_to resipis_path
  end

  def index
    @resipis = Resipi.all
  end

  def show
    @resipi = Resipi.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end
  
  def update
  end

  def destroy
    @resipi = Resipi.find(params[:id])
    @resipi.destroy
    redirect_to resipis_path
  end
  
  private

  def resipi_params
    params.require(:resipi).permit(:name, :image, :material, :introduction)
  end
  
end
