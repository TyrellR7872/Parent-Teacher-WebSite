module ControllerMacros

  def login_user_account
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user_account]
      user = FactoryBot.create(:user_account)
      sign_in user
    end
  end
  
end
