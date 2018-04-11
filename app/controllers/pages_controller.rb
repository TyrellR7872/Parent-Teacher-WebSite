class PagesController < ApplicationController
  def index

  end

  def about
  end

  def clubs
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
