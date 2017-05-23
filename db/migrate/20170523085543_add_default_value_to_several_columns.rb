class AddDefaultValueToSeveralColumns < ActiveRecord::Migration[5.1]
  def up
  change_column :events, :price, :integer, :default => 0
end

def down
  change_column :events, :price, :integer, :default => 0
end
end
