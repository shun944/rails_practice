class AddOverviewToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :overview, :string
  end
end
