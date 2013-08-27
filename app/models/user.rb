class User < ActiveRecord::Base

has_attached_file :avatar, :styles => 
                  { :medium => "300x300>", :thumb => "100x100>" }, 
                  :default_url => "/images/:style/missing.png"



  has_many :statuses, dependent: :destroy
  has_many :friendships, foreign_key: "friend_id", dependent: :destroy
  has_many :friends, through: :friendships

  before_save { self.email = email.downcase } 
  before_create :create_remember_token 

  validates :name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    Status.where("user_id = ?", id)
  end

  def full_name
    name + " " + last_name
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
