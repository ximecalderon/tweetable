class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Associations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  # set active storage default
  after_commit :add_default_avatar, on: %i[create update]

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open("app/assets/images/anonymus.png"),
                  filename: "anonymus.png", content_type: "image/png")
  end
end
