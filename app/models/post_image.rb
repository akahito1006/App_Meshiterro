class PostImage < ApplicationRecord
  
  belongs_to :user
  # 単数形
  attachment :image
  has_many :post_comments, dependent: :destroy
  # _idは含めない
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end  
end
