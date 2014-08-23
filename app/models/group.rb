class Group < ActiveRecord::Base
	has_many :shopping_lists
	has_many :containers
	has_many :user_groups
	has_many :receipts
  has_many :chatrooms
	

end
