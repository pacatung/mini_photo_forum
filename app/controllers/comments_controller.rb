class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_photo

  def create
    @comment = @photo.comments.build( comment_params )
    @comment.user = current_user

    @comment.save!
    #@comment.notify!

    respond_to do |format|
      format.html{ redirect_to root_url }
      format.js{ render :template => "comments/create" }
    end
  end

  def destroy
    @comment = @photo.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      # format.html { redirect_to root_url }
      format.js{ render :template => "comments/destroy" }
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
