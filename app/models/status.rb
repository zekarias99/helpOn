class Status < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true
	default_scope -> { order('statuses.created_at DESC') }
end
