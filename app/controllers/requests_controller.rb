class RequestsController < ApplicationController
  def new
    session[:request_params] ||={}
    session[:request_page] ="request_type"
    @request = Request.new(session[:request_params])
    @request.current_page = session[:request_page]
  end

  def create
    @user_account =  UserAccount.find(current_user_account.id)
    session[:request_params].deep_merge!(params[:request]) if params[:request]
    @request = Request.new(session[:request_params])
    @request.user_account = @user_account
    @request.current_page = session[:request_page]
    if params[:back]
      @request.previous_page
    elsif @request.last_page?
      @request.save if @request.all_valid?
    else
      @request.next_page
    end
    session[:request_page] = @request.current_page
    if @request.new_record?
      render "new" and return
    else
      session[:request_page] = session[:request_params] = nil
      flash[:notice] = "Request saved and submitted!"
      @user_account.requests << @request
      redirect_to root_path and return
    end
  end

  def show
      @request = Request.find(params[:id])
      @user_account = @request.user_account
  end

end
