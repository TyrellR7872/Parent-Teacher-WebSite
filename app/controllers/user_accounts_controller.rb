class UserAccountsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
    user = UserAccount.fill_user(UserAccount.new(create_update_params))
    byebug
    if !params[:pass_confirm].eql?user.password
      flash[:error] = "Error updating profile"
      redirect_to edit_user_account_path(user) and return
    end
    if user.save
      flash[:notice] = "User Account #{user.username} Successfully Created"
      session[:id] = user.id
      redirect_to user_accounts_path and return
    else
      flash[:warning] = "User Account #{user.username} Creation Failed"
      redirect_to new_user_account_path and return
    end
  end

  def update
    user = UserAccount.find(session[:id])
    user.update(create_update_params)
    if user.save
      session[:id] = user.id
      flash[:notice] = "Profile \"#{user.username}\" updated"
      redirect_to user_accounts_path and return
    else
      flash[:error] = "Error updating profile"
      redirect_to edit_user_account_path(user) and return
    end
  end

  def edit
    @user_account = UserAccount.find(session[:id])
  end

  def index
    @user_account = UserAccount.find(session[:id])
    byebug
  end


private
  def create_update_params
    params.require(:user_account).permit(:username,:password,:email,:childgrade,:childname,:homeaddress)
  end

end
