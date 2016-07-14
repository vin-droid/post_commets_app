class Post < ActiveRecord::Base
	has_many :comments , :dependent => :destroy
	belongs_to :user
	has_many :likes, as: :likeble , :dependent => :destroy

	#attr_accessor :likes_count,:unlikes_count 
	








def likes_count
	self.likes.where(like_status: true).size
end

def unlikes_count
	self.likes.where(like_status: false).size
end 
end

