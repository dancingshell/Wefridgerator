class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :email
      t.boolean :is_member
      t.references :group, index: true

      t.timestamps
    end
  end
end
