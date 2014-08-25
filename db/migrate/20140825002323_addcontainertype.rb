class Addcontainertype < ActiveRecord::Migration
  def change
  	remove_column :containers, :type, :string
  	add_column :containers, :container_type, :string

  end
end
