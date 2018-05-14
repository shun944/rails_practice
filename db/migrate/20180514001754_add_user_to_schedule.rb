class AddUserToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :user, foreign_key: true
  end
end
