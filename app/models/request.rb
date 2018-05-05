class Request < ApplicationRecord
  belongs_to :user_account

  attr_writer :current_page

  validates :projectname, :description, :price, :students, :presence => { :message => "cannot be blank" }

  def current_page
    @current_page || pages.first
  end

  def pages
    %w[request_type main]
  end

  def next_page
    self.current_page = pages[pages.index(current_page)+1]
  end

  def previous_page
    self.current_page = pages[pages.index(current_page)-1]
  end

  def first_page?
    current_page == pages.first
  end

  def last_page?
    current_page == pages.last
  end

end
