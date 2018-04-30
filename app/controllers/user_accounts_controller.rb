class UserAccountsController < ApplicationController
  def index
    if current_user_account.nil?
      flash[:warning] = "Sign in to view user accounts"
      redirect_to new_user_account_session_path and return
    end
    @useraccounts = UserAccount.filter_on_constraints(constraints)
    @tograde = params[:tograde] || ""
    @fromgrade = params[:fromgrade] || ""
    @name = params[:name] || ""
    @account_type = params[:accounttype] || ""
  end

  def show
    if !current_user_account.nil?
      if current_user_account.email == "troberts@colgate.edu"
        current_user_account.update_attribute :admin, true
      end
      @user_account = current_user_account.id == params[:id] ? UserAccount.find(current_user_account.id) : UserAccount.find(params[:id])
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

  def show_user
    if !current_user_account.nil?
      if current_user_account.email == "troberts@colgate.edu"
        current_user_account.update_attribute :admin, true
      end
      @user_account = UserAccount.find(params[:id])
      # current_user_account.id == params[:id] ? UserAccount.find(current_user_account.id) : UserAccount.find(params[:id])
    end
  end

  # DELETE /resource
  def destroy
    @user_account = current_user_account.id == params[:id] ? UserAccount.find(current_user_account.id) : UserAccount.find(params[:id])
    if @user_account.delete
      flash[:notice] = "User Account Successfully Deleted"
      redirect_to root_path
    end
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
