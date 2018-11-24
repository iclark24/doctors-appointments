class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:edit, :update]

  def index
    @physicians = Physician.all
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to physicians_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @physician.update(physician_params)
      redirect_to physicians_path
    else
      render :edit
    end
  end

  def destroy
    @physician.destroy
    redirect_to physicians_path
  end

  private
  def physician_params
    params.require(:physician).permit(:first_name, :last_name)
  end

  def set_physician
    @physician = Physician.find(params[:id])
  end


end