class Tweet < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :likes, dependent: :destroy

  # belongs_to :parent, as: :replied_to, class_name: "Tweet", optional: true
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count
  has_many :replies, class_name: "Tweet", foreign_key: "replied_to_id",
                     dependent: :destroy,
                     inverse_of: "replied_to"
  # counter_cache: true

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end
end
