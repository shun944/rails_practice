class Schedule < ApplicationRecord
    belongs_to :user
    has_many :goods, dependent: :destroy
    has_many :iine_users, through: :goods, source: :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id,    presence: true
    validates :title,      presence: true, length: { maximum: 50 }
    validates :overview,   presence: true, length: { maximum: 500 }
    validates :content,    presence: true, length: { maximum: 500 }
    validates :place,      presence: true, length: { maximum: 100 }
    validates :target_value, presence: true, numericality: {
                                                    only_integer: true, greater_than: 1
                                                    }
    #"いいね"する
    def iine(user)
        goods.create(user_id: user.id)
        #@schedule = Schedule.find(params[:id])
        #puts 'bbbbbbbbbbbbbbbbbbbbb'
        
        #if @schedule.goods_count >= @schedule.target_value
         #   @schedule.active_flag = true
          #  puts 'aaaaaaaaaaaaaaaaaaaaaa'
     #   end
    end
    
    #"いいね"を解除する
    def del_iine(user)
        goods.find_by(user_id: user.id).destroy
        #if schedule.goods_count < schedule.target_value
         #   active_flag = false
        #end
    end
    
    #現在のユーザーが"いいね"をしていたらtrue
    def iine?(user)
        iine_users.include?(user)
    end
end
