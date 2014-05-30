class Admin::InformationContentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_information_content, only: [:show, :edit, :update, :destroy]

  def index
    @information_contents = InformationContent.all.page(params[:page]).per(Settings.admin.display_number_per_page.information_content)
  end

  def show
  end

  def new
    @information_content = InformationContent.new
  end

  def edit
  end

  def create
    @information_content = InformationContent.new(information_content_params)

    respond_to do |format|
      if @information_content.save
        format.html { redirect_to [:admin, @information_content], notice: 'Information content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @information_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @information_content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @information_content.update(information_content_params)
        format.html { redirect_to [:admin, @information_content], notice: 'Information content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @information_content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @information_content.destroy
    respond_to do |format|
      format.html { redirect_to admin_information_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_content
      @information_content = InformationContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_content_params
      params.require(:information_content).permit(:information_area, :content)
    end
end
