class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.integer :user_id, null: false
      t.integer :schedule_id, null: false

      t.timestamps
      
      t.index :user_id
      t.index :schedule_id
      t.index [:user_id, :schedule_id], unique: true
    end
  end
end
