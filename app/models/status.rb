class Status < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :content, presence: true

  default_scope -> { order('created_at DESC') }
end
