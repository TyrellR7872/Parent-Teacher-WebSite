class UserAccountsController < ApplicationController

  def show
    if !current_user_account.nil?
      @user_account = UserAccount.find(current_user_account.id)
    else
      redirect_to new_user_account_registration_path and return
    end
  end


end
