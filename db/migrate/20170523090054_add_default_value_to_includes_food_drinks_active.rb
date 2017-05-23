class AddDefaultValueToIncludesFoodDrinksActive < ActiveRecord::Migration[5.1]
  def up
  change_column :events, :includes_food, :boolean, :default => false
  change_column :events, :includes_drinks, :boolean, :default => false
  change_column :events, :active, :boolean, :default => true
end

def down
  change_column :events, :includes_food, :boolean, :default => nil
  change_column :events, :includes_drinks, :boolean, :default => nil
  change_column :events, :active, :boolean, :default => nil
end
end
