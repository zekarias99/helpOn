class Micropost < ActiveRecord::Base

	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }

	belongs_to :user

	default_scope -> { order('microposts.created_at DESC') }

# Returns microposts from the users being followed by the given user.
  def self.from_users_joined_by(user)
    joined_user_ids = user.joined_user_ids
    where("user_id IN (:joined_user_ids) OR user_id = :user_id",
          joined_user_ids: joined_user_ids, user_id: user)
  end
end
