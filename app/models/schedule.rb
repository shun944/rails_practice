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
                                                    greater_than: 1
                                                    }
    #"いいね"する
    def iine(user)
        goods.create(user_id: user.id)
    end
    
    #"いいね"を解除する
    def del_iine(user)
        goods.find_by(user_id: user.id).destroy
    end
    
    #現在のユーザーが"いいね"をしていたらtrue
    def iine?(user)
        iine_users.include?(user)
    end
end
