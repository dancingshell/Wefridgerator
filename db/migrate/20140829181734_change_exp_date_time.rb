class ChangeExpDateTime < ActiveRecord::Migration
  def change
  	remove_column :items, :exp_date, :datetime
  	add_column :items, :exp_date, :date
  end
end
