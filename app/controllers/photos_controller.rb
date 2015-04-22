class PhotosController < ApplicationController

  before_action :set_photo, :only => [:show, :edit, :update, :destroy]


  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    # @photo.user = current_user

    if @photo.save
      flash[:notice] = "Photo was successfully created."
      redirect_to photos_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @photo.title

  end

  def edit

  end

  def update
    if @photo.update(photo_params)
      flash[:notice] = "Photo was successfully updated."
      redirect_to photo_path
    else
      render :action => :edit
    end
  end

  def destroy
    @photo.destroy

    flash[:alert] = "Photo was successfully deleted."

    redirect_to photos_path
  end

private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :pic)
  end

end
