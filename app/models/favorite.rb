class Favorite < ActiveRecord::Base
  attr_accessible :thing
  has_many :birthdays
  has_many :friends, through: :birthdays
  validates :thing, presence: true
end
