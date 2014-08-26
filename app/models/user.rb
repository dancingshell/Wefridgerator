class User < ActiveRecord::Base
	has_many :arts
	has_many :receipts
	has_many :messages
	has_many :shopping_lists
  
  # belongs_to :user_groups
  has_many :user_groups
  has_many :groups, through: :user_groups

	has_secure_password 

end
