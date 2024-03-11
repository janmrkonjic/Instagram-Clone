class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  #validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :posts, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :following_users, through: :followings, source: :following_user
  has_many :reverse_followings, foreign_key: :following_user_id, class_name: "Following"
  has_many :followers, through: :reverse_followings, source: :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  attr_writer :login
  def login
    @login || self.username || self.email
  end

  def self.from_google(u)
    create_with(uid: u[:uid], provider: 'google',
      password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
