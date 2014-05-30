class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  RESULT_PER_PAGE = 25

  def index
    @groups = Group.all.page(params[:page]).per(RESULT_PER_PAGE)
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.performer_ids = params[:group][:performer_ids]

    respond_to do |format|
      if @group.save
        format.html { redirect_to [:admin, @group], notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @group.attributes = group_params
    @group.performer_ids = params[:group][:performer_ids]

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to [:admin, @group], notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to admin_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :organized_on)
    end
end