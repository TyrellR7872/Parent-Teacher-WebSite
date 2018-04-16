class UserAccount < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.fill_user(user)
    user.childname = "" if user.childname.nil?
    user.name = "" if user.name.nil?
    user.childgrade = 0 if user.childgrade.nil?
    user.homeaddress = "" if user.homeaddress.nil?
    user
  end
end
