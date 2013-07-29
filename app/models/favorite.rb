class Favorite < ActiveRecord::Base
  attr_accessible :thing
  validates :thing, presence: true
end
