class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show
  @categories = @event.categories
  @photos = @event.photos
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      create_images
      redirect_to @event, notice: "Event successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      create_images
      redirect_to @event, notice: "Event successfully updated"
    else
      render :edit
    end
  end

  private

  def set_event
        @event = Event.find(params[:id])
      end

  def event_params
      params.require(:event).permit(:name, :description, :location, :price,
      :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active, :category_ids, :photos)
  end

  def image_params
  params[:images] ? params.require(:images) : []
  end

  def create_images
    image_params.each do |image|
     @event.photos.create(image: image)
   end

  end


end
