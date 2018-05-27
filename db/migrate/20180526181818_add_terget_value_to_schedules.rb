class AddTergetValueToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :terget_value, :integer, default: 0
    add_column :schedules, :good_count, :integer
  end
end
