class CommentsController < ApplicationController
  
  def create
    resipi = Resipi.find(params[:resipi_id])
    comment = current_user.comments.new(comment_params)
    comment.resipi_id = resipi.id
    comment.save
    redirect_to resipi_path(resipi)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to resipi_path(params[:resipi_id])
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
