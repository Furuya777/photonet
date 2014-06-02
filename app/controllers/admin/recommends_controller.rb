class Admin::RecommendsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @recommends = Recommend.all.page(params[:page]).per(Settings.admin.display_number_per_page.recommend)
  end

  def edit
    @recommend = Recommend.new
    if params[:confirmation].present?
      @recommend.assign_attributes(recommend_params)
      if @recommend.valid?
        render :edit_confirmation
      else
        render :edit
      end
    else
      @recommend = Recommend.find(params[:id])
      render :edit
    end
  end

  def update
    @recommend = Recommend.find(params[:id])
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to admin_recommends_path, notice: 'Recommend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommend_params
      params.require(:recommend).permit(:photo_id)
    end
end
