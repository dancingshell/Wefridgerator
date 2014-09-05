class AddUserToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :user, index: true
    add_column :messages, :comment, :text
  end
end
