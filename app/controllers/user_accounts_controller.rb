class UserAccountsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
    user = UserAccount.fill_user(UserAccount.new(create_update_params))
    if !user.password_confirmation.eql?user.password
      flash[:warning] = "Passwords are not equal"
      redirect_to new_user_account_path and return
    end
    if user.save
      flash[:notice] = "User Account '#{user.username}' Successfully Created"
      session[:id] = user.id
      session[:user] = user
      session[:pass] = user.password
      redirect_to user_accounts_path and return
    else
      flash[:warning] = "User Account '#{user.username}' Creation Failed"
      redirect_to new_user_account_path and return
    end
  end

  def update
    user = UserAccount.find(session[:id])
    user.update(create_update_params)
    user.password = session[:pass] if user.password == ""
    if !user.valid?
      flash[:warning] = "Please check your fields"
      redirect_to edit_user_account_path(user) and return
    end
    if user.save
      session[:id] = user.id
      flash[:notice] = "Profile '#{user.username}' updated"
      redirect_to user_accounts_path and return
    else
      flash[:warning] = "Error updating profile"
      redirect_to edit_user_account_path(user) and return
    end
  end

  def edit
    @user_account = UserAccount.find(session[:id])
  end

  def index
    begin
      @user_account = UserAccount.find(session[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "Please Sign Up for an Account"
      redirect_to new_user_account_path and return
    end

  end

  def members
    @members = UserAccount.filter_on_constraints(constraints)
  end

  def email
    members = UserAccount.filter_on_constraints(constraints)
    members.each do |user|
      UserMailer.new_message(user, email_details).deliver
    end
    redirect_to members_user_accounts_path(:accounttype => params[:accounttype], :name => params[:name], :fromgrade => params[:fromgrade], :tograde => params[:tograde])
  end




private
  def create_update_params
    params.require(:user_account).permit(:username,:email,:childgrade,:childname,:homeaddress,:name, :password, :password_confirmation)
  end

  def constraints
    constraints = [:name, :accounttype, :fromgrade, :tograde]
    hash = {}
    constraints.each do |sym|
      hash[sym] = params[sym] if params[sym].present?
    end
    hash
  end

  def email_details
    details = [:subject, :sender, :body]
    hash = {}
    details.each do |sym|
      hash[sym] = params[sym]
    end
    hash
  end

end
