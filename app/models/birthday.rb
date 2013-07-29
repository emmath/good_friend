class Birthday < ActiveRecord::Base
  attr_accessible :date, :favorite_id, :friend_id#,:nickname
  belongs_to :friend
  belongs_to :favorite
end
