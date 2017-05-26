class RemoveStatusFromRegistrations < ActiveRecord::Migration[5.1]
  def change
    remove_column :registrations, :status, :string
  end
end
