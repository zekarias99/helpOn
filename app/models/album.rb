class Album < ActiveRecord::Base

	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 60 }


	belongs_to :user
	has_many :pictures

	default_scope -> { order('created_at DESC') }
end
