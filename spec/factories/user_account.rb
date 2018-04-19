FactoryBot.define do

  factory :user_account, class: UserAccount do
    id 1
    name "TesterName"
    encrypted_password "testpass"
    email "testuser@test.com"
    accounttype "Parent"
    childname "Test Child"
    childgrade 5
    homeaddress "123 Test Street"
  end

end
