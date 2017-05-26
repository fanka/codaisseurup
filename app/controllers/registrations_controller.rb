class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @registration = current_user.registrations.create(registration_params)
    if @booking.event_available?
      @registration.save
      redirect_to @registration.event, notice: "Thank you for registering!"
    else
      redirect_to @registration.event, notice: "Sorry, there're no more available tickets for the chosen event."
  end

  private

  def registration_params
    params.require(:registration).permit(:price, :guest_count, :status, :event_id)
  end
end
