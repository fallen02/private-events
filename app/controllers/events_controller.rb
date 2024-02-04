class EventsController < ApplicationController
  before_action :set_event, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_creator!, only: [:edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path
      flash[:notice] = "Event created successfully"
    else
      flash[:notice] = @event.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
      flash[:notice] = "Event updated successfully!"
    end
  end

  def destroy
    @event.destroy
    redirect_to user_all_events_path
    flash[:alert] = "Event deleted successfully!"
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :time)
  end

  def authenticate_creator!
    unless @event.creator == current_user
      flash[:alert] = 'You must be creator to do this action!!'
      redirect_to event_path(@event.id)
    end
  end
end
