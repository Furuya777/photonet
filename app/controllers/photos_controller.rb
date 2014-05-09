class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]

  RESULT_PER_PAGE = 6

  def index
    if params[:tag].present?
      photos = Photo.tag(params[:tag]).order_created_at
    else
      photos = Photo.all.order_created_at
    end
    @photos = photos.page(params[:page]).per(RESULT_PER_PAGE)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end
end
