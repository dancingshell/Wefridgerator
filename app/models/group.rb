class Group < ActiveRecord::Base
	has_many :shopping_lists
	has_many :categories
	has_many :receipts
  has_many :chatrooms
  has_many :arts
  has_many :items, through: :categories
  
  # belongs_to :user_groups
  has_many :user_groups
	has_many :users, through: :user_groups

end
