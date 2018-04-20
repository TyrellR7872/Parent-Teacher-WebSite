class UserAccount < ApplicationRecord
  has_and_belongs_to_many :calendar_events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def self.filter_on_constraints(constraints)
    filtered = UserAccount.all
    constraints.each_pair do |sym, val|
      if sym == :name
        filtered = UserAccount.where("name LIKE ?", "%#{val}%")
      elsif sym == :accounttype
        filtered = UserAccount.where("accounttype == ?", val)
      elsif sym == :fromgrade
        filtered = UserAccount.where("childgrade >= ?", val)
      elsif sym == :tograde
        filtered = UserAccount.where("childgrade <= ?", val)
      end
    end
    filtered
  end

end
