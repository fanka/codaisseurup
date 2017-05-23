class EventsController < ApplicationController

  def index
    @events = current_user.events
  end

  def show

  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event successfully updated"
    else
      render :edit
    end
  end

  private

  def event_params
      params.require(:event).permit(:name :description, :location, :price,
      :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active)
  end


end
