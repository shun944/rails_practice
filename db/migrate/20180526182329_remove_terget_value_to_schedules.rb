class RemoveTergetValueToSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :terget_value, :int
  end
end
