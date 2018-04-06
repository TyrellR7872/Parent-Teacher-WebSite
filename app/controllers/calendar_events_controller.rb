require 'date' # or is it datetime?

class CalendarEventsController < ApplicationController

  def index
    @calendar_events = CalendarEvent.where('is_approved = ?', true)
    @calendar_events = @calendar_events.event_between(params[:start_date_time],params[:end_date_time]) if params[:start_date_time].present? || params[:end_date_time].present?
    order = params[:order] || :start_date_time
    @calendar_events = @calendar_events.order(order)
  end

  def show
    id = params[:id]
    @user_account = session[:user]
    @calendar_event = CalendarEvent.find(id)
  end

  def create
    @calendar_event = CalendarEvent.new(create_update_params)
    @calendar_event.start_date_time = @calendar_event.start_date_time.to_formatted_s(:short)
    @calendar_event.end_date_time = @calendar_event.end_date_time.to_formatted_s(:short)
    # is_approved = @calendar_event.is_approved
    if @calendar_event.save
      if @calendar_event.is_approved
        flash[:success] = "New event \'#{@calendar_event.title}\' created and added to the page"
      else
        flash[:notice] = "New event \'#{@calendar_event.title}\' awaiting approval"
      end
      redirect_to calendar_events_path
    else
      flash[:warning]= "Error creating new event"
      redirect_to new_calendar_event_path(@calendar_event)
    end
  end

  def edit
    id = params[:id]
    @user_account = session[:user]
    @calendar_event = CalendarEvent.find(id)
  end

  def update
    id = params[:id]
    @calendar_event = CalendarEvent.find(id)

    @calendar_event.update(create_update_params)
    if @calendar_event.save
      flash[:success] = "Event \'#{@calendar_event.title}\' updated"
      redirect_to calendar_event_path(@calendar_event) and return
    else
      flash[:error] = "Error updating event"
      redirect_to edit_calendar_event_path(@calendar_event) and return
    end
  end

  def new
    @user_account = session[:user]
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