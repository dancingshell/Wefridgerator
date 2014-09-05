class RemoveChatroomModel < ActiveRecord::Migration
  def change
  	drop_table :chatrooms
  	remove_reference :messages, :chatroom, index: true
  	add_reference :messages, :group, index: true
  end
end
