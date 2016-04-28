class User < ActiveRecord::Base

has_secure_password
has_many :posts , :dependent => :destroy
has_many :likes , :dependent => :destroy
has_many :comments , :dependent => :destroy
has_many :friendships , :dependent => :destroy
has_many :users, through: :friendships , :dependent => :destroy


#====================== validation ===========================#

    validates :email_id, confirmation: true , presence: true ,uniqueness: true

validates :password_digest , presence: true  



#===================================Like & Dislike check ======================#

    def already_likes?(post ,like_type)
    
    	 self.likes.where(likeble_id: post.id ,user_id: self.id ,likeble_type: like_type ,like_status: true).count > 0
       
    end
     def already_dislikes?(post ,like_type)
    	
    	 self.likes.where(likeble_id: post.id ,user_id: self.id ,likeble_type: like_type,like_status: false).count > 0
       
    end


#=================================Methods for friend request==============================#

    def invited
    end
    
    def invited_by
     end

     def friends 
     end


     def pending_invited
      Friendship.where(friendable_id: self.id ,pending: true)
     end 


def pending_invited_by

end

def friend_with?(user)
end




# user cant send if already connected with that user
def connected_with?(user)
     Friendship.where(
        friendable_id: user.id , friend_id: self.id).count>0||
    Friendship.where(friendable_id: self.id , friend_id: user.id).count>0
end

def invited_by?(user)
end 

def invited?(user)
end


def common_friends_with(user)
end

# is user has friend request
def has_friend_request?
		  Friendship.where(friend_id: self.id , pending: true).count > 0
end

# return total friend requests
def has_friend_request
	  Friendship.where(friend_id: self.id , pending: true)
end

# return total friendships
def has_friendships
    Friendship.where("friendable_id =? OR friend_id =?" ,self.id ,self.id).where(pending:false)
end




# user can send friend request only these user 
        def has_frienshipable_friends
                @all_other_users = User.where.not(id: self.id)
                friendshipable_friends = Array.new

                #find users not connected with  you 
                @all_other_users.each do |friendshipable_friend|
                    if !(Friendship.exists?(friendable_id: friendshipable_friend.id , friend_id: self.id)||
                                     Friendship.exists?(friendable_id: self.id , friend_id: friendshipable_friend.id)) 

                         friendshipable_friends.push(friendshipable_friend)
                    end
                end
           return friendshipable_friends
        end

end

=begin
# @mac sends a friend request to @dee
@mac.friend_request(@dee)

# @dee can accept the friend request
@dee.accept_request(@mac)

# @dee can also decline the friend request
@dee.decline_request(@mac)
A friendship can also be removed:

# @dee removes @mac from its friends
@dee.remove_friend(@mac)=end

=begin
Type of friends

There are four types of friends:

requested_friends
pending_friends
blocked_friends
friends
They can be accessed using association.

requested_friends

Instances that sent friend request that has not been accepted.

@mac.friend_request(@dee)

@dee.requested_friends # => [@mac]
pending_friends

Instances that received but has not accepted the friend request.
 
@mac.friend_request(@dee)

@mac.pending_friends # => [@dee]
blocked_friends

Instances that are blocked from taking any friendship actions

@dee.friend_request(@mac)
@mac.block_friend(@dee)

@mac.blocked_friends # => [@dee]
friends

Instances with accepted Friendship.

@mac.friend_request(@dee)
@dee.accept_request(@mac)

@mac.friends # => [@dee]
@dee.friends # => [@mac]=end

