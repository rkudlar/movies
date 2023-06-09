class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :username, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid) do |u|
      u.email = auth.info.email
      u.password = Devise.friendly_token[0, 20]
      u.username = auth.info.name.parameterize
    end
    user.update!(token: auth.credentials.token)
    user
  end
end
