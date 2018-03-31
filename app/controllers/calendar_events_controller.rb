class CalendarEventsController < ApplicationController

  def index
    
  end

  def show
  end

  def create
    # event = CalendarEvent.new(create_update_params)
    # if event.save
    #   flash[:success] = "New event \'#{event.title}\' created"
    #   redirect_to calendar_events_path
    # else
    #   flash[:warning]= "Error creating new event"
    #   redirect_to new_calendar_event_path(event)
    # end
  end

  def edit
  end

  def new
  end

  def create_update_params
    params.require(:calendar_event).permit(:title, :date, :time, :location, :description, :type, :contact_person, :is_approved)
  end

end
