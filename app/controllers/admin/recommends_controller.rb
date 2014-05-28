class Admin::RecommendsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]

  RESULT_PER_PAGE = 25

  def index
    @recommends = Recommend.all.page(params[:page]).per(RESULT_PER_PAGE)
  end

  def show
  end

  def new
    @recommend = Recommend.new
  end

  def edit
  end

  def create
    @recommend = Recommend.new(recommend_params)

    respond_to do |format|
      if @recommend.save
        format.html { redirect_to @recommend, notice: 'Recommend was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recommend }
      else
        format.html { render action: 'new' }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to @recommend, notice: 'Recommend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recommend.destroy
    respond_to do |format|
      format.html { redirect_to recommends_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend
      @recommend = Recommend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommend_params
      params[:recommend]
    end
end
