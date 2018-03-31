class CalendarEventsController < ApplicationController

    def index
    end

    def show
    end

    def edit
    end

    def new
    end

    def create_update_params
        params.require(:calendar_event).permit(:title, :date, :time, :location, :description, :type, :contact_person, :is_approved)
    end

end
