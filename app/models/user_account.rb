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

  def self.filter_on_constraints(constraints)
    filtered = UserAccount.all
    constraints.each_pair do |sym, val|
      if sym == :name
        filtered = UserAccount.where("name LIKE ?", "%#{val}%")
      elsif sym == :accounttype
        filtered = UserAccount.where("accounttype == ?", val)
      elsif sym == :fromgrade
        filtered = UserAccount.where("childgrade >= ?", val)
      else
        filtered = UserAccount.where("childgrade <= ?", val)
      end
    end
    filtered
  end
end
