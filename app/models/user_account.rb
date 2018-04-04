class UserAccount < ApplicationRecord
  validates :username, presence: {message: "Must be given"}
  validates :password, confirmation: true, on: create
  validates :email, presence: {message: "Must be given"}



  def self.fill_user(user)
    user.childname = ""
    user.childgrade = 0
    user.homeaddress = ""
    user
  end
end
