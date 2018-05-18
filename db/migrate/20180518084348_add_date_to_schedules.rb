class AddDateToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :date, :date
    add_column :schedules, :place, :string
    add_column :schedules, :active_flag, :boolean, default: false, null: false
  end
end
