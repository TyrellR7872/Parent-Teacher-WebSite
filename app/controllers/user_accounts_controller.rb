class UserAccountsController < ApplicationController

  def index
    if current_user_account.nil?
      flash[:warning] = "Sign in to view user accounts"
      redirect_to new_user_account_session_path and return
    end
    @members = UserAccount.filter_on_constraints(constraints)
    @tograde = params[:tograde] || ""
    @fromgrade = params[:fromgrade] || ""
    @name = params[:name] || ""
    @account_type = params[:accounttype] || ""
    @body = params[:body] || ""
    @subject = params[:subject] || ""
  end

  def show
    if !current_user_account.nil?
      @user_account = UserAccount.find(current_user_account.id)
    end
  end

  def email
    members = UserAccount.filter_on_constraints(constraints)
    members.each do |user|
      UserMailer.new_message(user, email_details).deliver
    end
    flash[:notice] = "Message sent to the following users"
    redirect_to user_accounts_path(:accounttype => params[:accounttype], :name => params[:name], :fromgrade => params[:fromgrade],
      :tograde => params[:tograde], :subject => params[:subject], :body => params[:body]) and return
  end

  private
  def constraints
    constraints = [:name, :accounttype, :fromgrade, :tograde]
    hash = {}
    constraints.each do |sym|
      hash[sym] = params[sym] if params[sym].present?
    end
    hash
  end

  def email_details
    details = [:subject, :body]
    hash = {}
    details.each do |sym|
      hash[sym] = params[sym]
    end
    hash[:from] = current_user_account.name
    hash
  end



end
