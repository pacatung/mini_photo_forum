class PhotosController < ApplicationController

  before_action :set_photo, :only => [:show, :edit, :update, :destroy]


  def index
    @photos = Photo.all
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

protected

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
