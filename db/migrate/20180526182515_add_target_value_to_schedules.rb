class AddTargetValueToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :target_value, :integer, default: 0
  end
end
