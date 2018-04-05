class UserAccount < ApplicationRecord
  validates :username, presence: {message: "Must be given"}, length: {minimum: 5}
  validates :password, confirmation: true, on: new, length: {minimum: 6}
  validates :email, presence: {message: "Must be given"}


  def self.fill_user(user)
    user.childname = ""
    user.childgrade = 0
    user.homeaddress = ""
    user
  end
end
