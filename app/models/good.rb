class Good < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  counter_culture :schedule
  validates :user_id, presence: true
  validates :schedule_id, presence: true
    
end
