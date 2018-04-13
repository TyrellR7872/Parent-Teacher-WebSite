class PagesController < ApplicationController
    def show
    # Show the appropriate static pages from the /views folder, or
    # render file 404 error
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

  # NOTE: Deprecated method, no longer need as we have show() now.
  #
  # def index
  # end
  #
  # def about
  # end
  #
  # def clubs
  # end
end
