class BookingsController < ApplicationController
  before_action :set_event, only: [:create, :showattendees]
  before_action :authenticate_user!, only: [:showjoinedevents]
  def create
    @booking = Booking.new(attendee: current_user, attended_event: @event)
    if @booking.save
      redirect_to root_path
      flash[:notice] = "Send request successfully!"
    else
      redirect_to root_path
      flash[:notice] = @booking.errors.full_messages
    end
  end

  def showjoinedevents
    @joinedevents = current_user.attended_events
  end

  def showattendees
    @attendees = @event.attendees
  end



  protected

  def set_event
    @event = Event.find(params[:event_id])
  end
end
