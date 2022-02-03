class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: true
  validates :user_id, uniqueness: { scope: :tweet }
end
