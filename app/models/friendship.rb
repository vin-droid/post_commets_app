class Friendship < ActiveRecord::Base
     #belongs_to :friendships 
belongs_to :user
scope :accepted, -> { where(pending: false) }


 def invite(user)
 
 end


  def approve(user)
  
  end 

  def decline
  end

end
