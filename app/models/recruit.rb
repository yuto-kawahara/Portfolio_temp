class Recruit < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :reservations, dependent: :destroy

  
  def reservated_by?(user)
    reservations.where(user_id: user.id).exists?
  end
end
