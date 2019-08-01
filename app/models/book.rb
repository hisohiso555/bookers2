class Book < ApplicationRecord

  belongs_to :user

  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  def favorited?(id)
  	favorites.where(user_id: id).exists?
  end

end
