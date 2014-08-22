class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :type
      t.references :group, index: true

      t.timestamps
    end
  end
end
