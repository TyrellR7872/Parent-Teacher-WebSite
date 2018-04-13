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
      filtered = filtered.where("accounttype == ?", val) if sym == :accounttype and val.present?
      filtered = filtered.where("childgrade >= ?", val) if sym == :fromgrade and val.present?
      filtered = filtered.where("childgrade <= ?", val) if sym == :tograde and val.present?
    end
    filtered
  end
end
