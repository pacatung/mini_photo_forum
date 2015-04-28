class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_photo

  def create
    # using Ajax to like
    existing_like = @photo.find_like_by_user(current_user)

    unless existing_like
      @like = Like.create(:user => current_user, :photo => @photo)
    end

    respond_to do |format|
      format.html{ redirect_to :back }
      format.js{
        @photo.reload
        render :template => "likes/reload"
      }
    end
  end

  def destroy
    # using Ajax to dislike
    @like = current_user.likes.find( params[:id] )
    @like.destroy
    @like = nil

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        @photo.reload
        render :template => "likes/reload"
      }
    end
  end

end
