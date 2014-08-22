class User < ActiveRecord::Base
	has_many :arts
	has_many :receipts
	has_many :messages
	has_many :shopping_lists
	





end
