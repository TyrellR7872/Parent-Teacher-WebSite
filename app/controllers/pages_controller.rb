class PagesController < ApplicationController
  def index

  end

  def about
  end

  def clubs
  end

  def show
    # Show the appropriate static pages from the /views folder, or
    # render file 404 error
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
  
  # def show
  #   render template: "pages/#{params[:page]}"
  # end
  #
  # def show
  #   if valid_page?
  #     render template: "pages/#{params[:page]}"
  #   else
  #     render file: "public/404.html", status: :not_found #TODO
  #   end
  # end
  #
  # private
  # def valid_page?
  #   File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  # end
end
