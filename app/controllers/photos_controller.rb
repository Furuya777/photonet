class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.tag_ids = params[:photo][:tag_ids]

    respond_to do |format|
      if @photo.save
        copy_images
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.attributes = photo_params
    @photo.tag_ids = params[:photo][:tag_ids]

    respond_to do |format|
      if @photo.save
        copy_images
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :content, :image, :image_cache)
    end

    def copy_images
      file_dir = "#{Rails.root}/public/uploads/photo/image/#{@photo.id}/"
      FileUtils.mkdir(file_dir) unless File.directory?(file_dir)

      FileUtils.cp("#{Rails.root}#{@photo.image.url(:thumb)}", "#{Rails.root}/public#{@photo.image.url(:thumb)}")
      FileUtils.cp("#{Rails.root}#{@photo.image.url(:show)}", "#{Rails.root}/public#{@photo.image.url(:show)}")
    end
end
