FactoryBot.define do
  factory :user_account do
    name 'Test User'
    email 'testuser@colgate.edu'
    password 'testing'
    password_confirmation 'testing'
  end
end
