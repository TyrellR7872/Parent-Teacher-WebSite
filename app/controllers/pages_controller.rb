class PagesController < ApplicationController
<<<<<<< HEAD
  def index
  end
  def about
  end
  def clubs
=======

    def show
    # Show the appropriate static pages from the /views folder, or
    # render file 404 error
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
>>>>>>> 47a67e901809ae3e9e38814948b7e25000611b2e
  end
end
