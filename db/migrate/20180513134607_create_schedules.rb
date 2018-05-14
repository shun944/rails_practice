class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.text :content
      t.text :title

      t.timestamps
    end
    #add_index :schedules, [:user_id, :created_at]
  end
end
