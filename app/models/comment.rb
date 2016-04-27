class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  	 has_many :likes, as: :likeble , :dependent => :destroy

end
