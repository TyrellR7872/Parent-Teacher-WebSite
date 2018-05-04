module ControllerMacros
  FactoryBot.define do
    factory :user_account do
      name 'Test User'
      email 'testuser@colgate.edu'
      password 'testing'
      password_confirmation 'testing'
    end

  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user_account]
      user = FactoryBot.create(:user_account)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user_account]
      user = FactoryBot.create(:user_account)
      user.update_attribute(:admin, true)

      sign_in user
    end
  end


end
