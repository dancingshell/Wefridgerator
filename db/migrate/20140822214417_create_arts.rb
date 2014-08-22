class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :json
      t.references :user, index: true
      t.references :container, index: true

      t.timestamps
    end
  end
end
