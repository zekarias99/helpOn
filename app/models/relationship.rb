class Relationship < ActiveRecord::Base

	belongs_to :joiner, class_name: "User"
	belongs_to :joined, class_name: "User"

	validates :joiner_id, presence: true
	validates :joined_id, presence: true
end
