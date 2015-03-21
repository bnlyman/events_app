class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @event = Event.find(params[:id]) 
  end

  def index
    @events = Event.all
  end

  def new
    @event = @event.new
  end

  def create
    @event = @event.new(event_params)
    if @event.save
      redirect_to @event
    else
      redirect_to :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.user != current_user
      redirect_to @event, notice: "You are not authorized to edit this event."
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user != current_user
      redirect_to @event, notice: "You are not authorized to delete this event."
    else
    @even.destroy
    redirect_to index_path
    end
  end

private
  def event_params
    params.require(:event).permit(:title,:location, :price, :category, :rating, :description, :user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
