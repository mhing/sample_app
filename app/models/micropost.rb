class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') } # puts in descending order from newest to oldest
	#validation for the micropost's user_id
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
end
