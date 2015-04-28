class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  before_action :set_photo, :only => [:show]
  before_action :set_my_photo, :only => [:edit, :update, :destroy]

  def index
    @photos = Photo.all.order("id DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

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

  def subscribe
    @photo = Photo.find(params[:id])
    existing_subscription = @photo.find_subscription_by_user(current_user)
    unless existing_subscription
      @subscription = Subscription.create(:user => current_user, :photo => @photo)
    end

    redirect_to :back
  end

  def unsubscribe
    @photo = Photo.find(params[:id])
    existing_subscription = @photo.find_subscription_by_user(current_user)

    existing_subscription.destroy
    redirect_to :back
  end

private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_my_photo
    @photo = current_user.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :pic)
  end

end
