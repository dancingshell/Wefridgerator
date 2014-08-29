class FixDateTimeAddImageFieldToCatergory < ActiveRecord::Migration
  def change
    remove_column :items, :exp_date, :date
    add_column :items, :exp_date, :datetime
    add_column :categories, :image, :string
  end
end
