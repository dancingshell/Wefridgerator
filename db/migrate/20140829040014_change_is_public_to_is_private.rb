class ChangeIsPublicToIsPrivate < ActiveRecord::Migration
  def change
    remove_column :items, :is_public, :boolean
    add_column :items, :is_private, :boolean
  end
end
