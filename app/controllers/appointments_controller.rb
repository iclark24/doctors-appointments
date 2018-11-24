class AppointmentsController < ApplicationController

  before_action :set_appointment, only: [:edit, :update]
  # before action :set_physicians, only: [:new, :edit]

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
    @physicians = Physician.all
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  def edit
    @physicians = Physician.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:physician_id)
  end

  # don't just find by the appointment model or you may potentially be able to view other users appointments
  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  # def set_physicians
  #   @physicians = Physician.all
  # end

end
