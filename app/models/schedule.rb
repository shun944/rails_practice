class Schedule < ApplicationRecord
    belongs_to :user
    has_many :goods, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    validates :user_id,    presence: true
    validates :title,      presence: true, length: { maximum: 50 }
    validates :overview,   presence: true, length: { maximum: 500 }
    validates :content,    presence: true, length: { maximum: 500 }
    
    #"いいね"する
    def iine(user)
        goods.create(user_id: user.id)
    end
    
    #"いいね"を解除する
    def del_iine(user)
        likes.find_by(user_id: user.id).destroy
    end
end
