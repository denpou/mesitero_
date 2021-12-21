class ResipisController < ApplicationController
  
  def new
    @resipi = Resipi.new
  end

  def create
    @resipi = Resipi.new(resipi_params)
    @resipi.user_id = current_user.id
    if @resipi.save
      redirect_to resipis_path
    else
      render :new
    end
  end

  def index
    @resipis = Resipi.page(params[:page]).reverse_order
  end

  def show
    @resipi = Resipi.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @resipi = Resipi.find(params[:id])
    @resipi.destroy
    redirect_to resipis_path
  end
  
  def search
    @resipis = Resipi.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  private

  def resipi_params
    params.require(:resipi).permit(:name, :image, :material, :introduction)
  end
  
end