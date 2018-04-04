require 'date' # or is it datetime?

class CalendarEventsController < ApplicationController

  def index
    @calendar_events = CalendarEvent.all
    @calendar_events = @calendar_events.where('is_approved = ?', true).order('start_date_time')
    order = params[:order]
    search = params[:search]
    if !order.nil?
      @calendar_events = @calendar_events.order(order)
    end
    if !search.nil?
      @calendar_events = @calendar_events.event_between(search[:start_date_time], search[:end_date_time])
    end
  end

  def show
    id = params[:id]
    @calendar_event = CalendarEvent.find(id)
  end

  def create
    @calendar_event = CalendarEvent.new(create_update_params)
    @calendar_event.start_date_time = @calendar_event.start_date_time.to_formatted_s(:short)
    @calendar_event.end_date_time = @calendar_event.end_date_time.to_formatted_s(:short)
    if @calendar_event.save
      flash[:success] = "New event \'#{@calendar_event.title}\' created"
      redirect_to calendar_events_path
    else
      flash[:warning]= "Error creating new event"
      redirect_to new_calendar_event_path(@calendar_event)
    end
  end

  def edit
    id = params[:id]
    @calendar_event = CalendarEvent.find(id)
  end

  def update
    id = params[:id]
    @calendar_event = CalendarEvent.find(id)

    @calendar_event.update(create_update_params)
    if @calendar_event.save
      flash[:notice] = "Event \"#{@calendar_event.title}\" updated"
      redirect_to calendar_events_path and return
    else
      flash[:error] = "Error updating event"
      redirect_to edit_calendar_event_path(@calendar_event) and return
    end
  end

  def new
    @calendar_event = CalendarEvent.new
  end

  def destroy
    id = params[:id]
    @calendar_event = CalendarEvent.find(id)
    @calendar_event.destroy
    flash[:notice] = "Event \'#{@calendar_event.title}\' deleted"
    redirect_to calendar_events_path
  end

  def create_update_params
    params.require(:calendar_event).permit(:title, :start_date_time, :end_date_time, :location, :description, :is_sport, :is_musical, :is_meeting, :is_charity, :is_gathering, :is_optional, :for_teacher, :for_parent, :for_elementary_student, :for_highschool_student, :contact_person, :is_approved)
  end

end
