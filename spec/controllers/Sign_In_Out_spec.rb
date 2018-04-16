RSpec.describe RegistrationsController do
  include Devise::TestHelpers
  login_user_account

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end
end
