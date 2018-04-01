class CalendarEventsController < ApplicationController

  def index
    @calendar_event = CalendarEvent.all
    @calendar_event = @calendar_event.where(:is_approved => true)
  end

  def show
    @calendar_event = CalendarEvent.find(params[:id])
  end

  def create
    @calendar_event = CalendarEvent.new(create_update_params)
    if @calendar_event.save
      flash[:success] = "New event \'#{event.title}\' created"
      redirect_to calendar_events_path
    else
      flash[:warning]= "Error creating new event"
      redirect_to new_calendar_event_path(event)
    end
  end

  def edit
    @calendar_event = CalendarEvent.find(params[:id])
  end

  def new
    @calendar_event = CalendarEvent.new
  end

  def create_update_params
    params.require(:calendar_event).permit(:title, :start_date, :location, :description, :is_sport, :is_musical, :is_meeting, :is_charity, :is_gathering, :is_optional, :for_teacher, :for_parent, :for_elementary_student, :for_highschool_student, :contact_person, :is_approved)
  end

end
