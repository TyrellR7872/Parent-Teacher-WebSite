# frozen_string_literal: true

class UserAccounts::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    user = UserAccount.find(current_user_account.id)
    user.update(update_params)
    if user.save
      flash[:success] = "Profile '#{user.name}' updated"
      redirect_to user_account_path(user) and return
    else
      flash[:warning] = "Error updating profile"
      redirect_to edit_user_account_registration_path(user) and return
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  def configure_sign_up_params
    attrs = [:name,:childname,:childgrade, :homeaddress]
    devise_parameter_sanitizer.permit(:sign_up, keys: attrs)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    attrs = [:name,:childname,:childgrade, :homeaddress]
    devise_parameter_sanitizer.permit(:account_update, keys: attrs)
  end
  private
    def update_params
      params.require(:user_account).permit(:email,:childgrade,:childname,:homeaddress,:name)
    end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
