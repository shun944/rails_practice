class AddScheduleToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :schedule, foreign_key: true
  end
  add_index :schedules, [:user_id, :created_at]
end
