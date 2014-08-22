class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.references :group, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
