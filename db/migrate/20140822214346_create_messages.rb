class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :chatroom, index: true

      t.timestamps
    end
  end
end
