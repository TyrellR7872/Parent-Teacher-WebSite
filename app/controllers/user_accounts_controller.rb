class UserAccountsController < ApplicationController

  def index
    @members = UserAccount.filter_on_constraints(constraints)
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
    redirect_to user_accounts_path(:accounttype => params[:accounttype], :name => params[:name], :fromgrade => params[:fromgrade], :tograde => params[:tograde])
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


end
