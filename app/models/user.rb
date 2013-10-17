class User < ActiveRecord::Base

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

  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "joiner_id", dependent: :destroy
  has_many :joined_users, through: :relationships, source: :joined
  has_many :reverse_relationships, foreign_key: "joined_id", 
                                    class_name: "Relationship", 
                                    dependent: :destroy
  has_many :joiners, through: :reverse_relationships, source: :joiner
  has_many :charities, dependent: :destroy
  has_many :pictures, dependent: :destroy


  has_attached_file :avatar, styles: { large: "800x800>", medium: "300x200>",
                                       small: "260x180>", thumb: "80x80#" }

  def full_name
    name + " " + last_name
  end


  def self.get_gravatars
    all.each do |user|
      if !user.avatar?
        user.avatar = URI.parse(user.gravatar_url)
        user.save
        print "."
      end
    end
  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end

  def joining?(other_user)
    relationships.find_by(joined_id: other_user.id)
  end

  def join!(other_user)
    relationships.create!(joined_id: other_user.id)
  end

  def unjoin!(other_user)
    relationships.find_by(joined_id: other_user.id).destroy!
  end


  def feed
    Micropost.from_users_joined_by(self)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
