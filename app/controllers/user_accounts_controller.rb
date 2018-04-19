class UserAccountsController < ApplicationController

  def show
    if !current_user_account.nil?
      @user_account = UserAccount.find(current_user_account.id)
    end
  end


end
