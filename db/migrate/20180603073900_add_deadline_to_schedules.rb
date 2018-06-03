class AddDeadlineToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :deadline, :date
  end
end
