class Admin::PerformersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_performer, only: [:show, :edit, :update, :destroy]

  def index
    @performers = Performer.all.page(params[:page]).per(Settings.admin.display_number_per_page.performer)
  end

  def show
  end

  def new
    @performer = Performer.new
  end

  def edit
  end

  def create
    @performer = Performer.new(performer_params)

    respond_to do |format|
      if @performer.save
        format.html { redirect_to [:admin, @performer], notice: 'Performer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @performer }
      else
        format.html { render action: 'new' }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @performer.update(performer_params)
        format.html { redirect_to [:admin, @performer], notice: 'Performer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @performer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @performer.destroy
    respond_to do |format|
      format.html { redirect_to admin_performers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performer
      @performer = Performer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performer_params
      params.require(:performer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birth, :gender, :profile, :leaved_on, :graduated_on)
    end

end
