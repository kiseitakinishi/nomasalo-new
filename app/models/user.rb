class User < ApplicationRecord
  validates :name , presence: true
  validates :age , presence: true
  validates :email, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader

  has_many :messages
  has_many :posts
  has_many :reviews

  has_secure_password

  validates :password, presence: false, on: :facebook_login

    def self.from_omniauth(auth)
        # emailの提供は必須とする
        user = User.where('email = ?', auth.info.email).first
      if user.blank?
        user = User.new
      end
    user.uid   = auth.uid
    user.name  = auth.info.name
    user.email = auth.info.email
    user.icon  = auth.info.image
    user.oauth_token      = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user
    end
end
