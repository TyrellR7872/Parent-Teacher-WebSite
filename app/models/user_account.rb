class UserAccount < ApplicationRecord
  def self.fill_user(user)
    user.childname = ""
    user.childgrade = 0
    user.homeaddress = ""
    user.name = ""
    user
  end
end
