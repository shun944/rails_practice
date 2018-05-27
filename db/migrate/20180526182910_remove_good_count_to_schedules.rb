class RemoveGoodCountToSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :good_count, :integer
  end
end
