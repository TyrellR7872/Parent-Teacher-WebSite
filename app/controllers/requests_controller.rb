class RequestsController < ApplicationController
  def new
    session[:request_params] ||= {}
    @request = Request.new(session[:request_params])
    @request.current_page = session[:request_page]
  end

  def create
    @user =  UserAccount.find(current_user_account.id)
    session[:request_params].deep_merge!(params[:request]) if params[:request]
    @request = Request.new(session[:request_params])
    @request.current_page = session[:request_page]
    # if @request.valid?
    if params[:back]
      @request.previous_page
    elsif @request.last_page?
      @request.save 
    else
      @request.next_page
    end
    session[:request_page] = @request.current_page
    # end
    if @request.new_record?
      render "new"
    else
      session[:request_page] = session[:request_params] = nil
      flash[:notice] = "request saved!"
      @user.requests << @request
      redirect_to action: "index"
    end
  end

  def index
    @user = UserAccount.find(current_user_account.id)
    @requests = @user.requests
  end

  def show
  end

  def destroy
  end
end
