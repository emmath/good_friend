class Friend < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :birthdays
  has_many :favorites, through: :birthdays
  validates :name, presence: true
end
