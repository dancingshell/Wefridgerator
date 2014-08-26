class Group < ActiveRecord::Base
	has_many :shopping_lists
	has_many :containers
	has_many :receipts
  has_many :chatrooms
  
  # belongs_to :user_groups
  has_many :user_groups
	has_many :users, through: :user_groups

end
