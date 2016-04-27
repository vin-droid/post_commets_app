class Post < ActiveRecord::Base
	has_many :comments , :dependent => :destroy
	belongs_to :user
	 has_many :likes, as: :likeble , :dependent => :destroy
	 
end
