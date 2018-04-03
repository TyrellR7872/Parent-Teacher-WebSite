class UserAccountsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
    @user_account = UserAccount.new(create_update_params)
    if @user_account.save
      flash[:notice] = "User Account #{@user_account.username} Successfully Created"
      session[:user_id] = @user_account.email
      redirect_to edit_user_account_path and return
    else
      flash[:warning] = "User Account #{@user_account.username} Creation Failed"
      redirect_to_to new_user_account_path and return
    end
  end


  def update
  end

  def index

  end


private
  def create_update_params
    params.require(:user_account).permit(:username,:password,:email,:accounttype)
  end

end
