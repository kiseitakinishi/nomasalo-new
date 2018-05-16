class Review < ApplicationRecord
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  validates :star, presence: true


  belongs_to :user
end
