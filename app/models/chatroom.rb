class Chatroom < ActiveRecord::Base
	has_many :messages

  belongs_to :group
end
