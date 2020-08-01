class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :body, presence: true,    length: { maximum: 140 }    
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
