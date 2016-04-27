class FriendshipsController < ApplicationController

before_action :find_request ,only:[:friend_request_accept ,:friend_request_reject]



#user accept friend request
def friend_request_accept
       
        @friendship.pending = false
        @friendship.save
        redirect_to root_path 
end 
#user reject friend request
def friend_request_reject
       @friendship.destroy
        redirect_to root_path    
end


# send friend request
 def invite
        @user = User.find(params[:friendable_id])
        @makeble_friend = User.find(params[:friend_id])
        friendship = current_user.friendships.create(friend_id: @makeble_friend.id,
        	          friendable_id: @user.id,pending: true ,block: 'Unblocked')
        friendship.save
       redirect_to root_path
 end

private 

 def find_request
     @friendship = Friendship.where(friendable_id: params[:friendable_id],friend_id: params[:friend_id]).first
 end

def find_params
	p params
    params.require(:friendship).permit(:friend_id ,:friendable_id,:pending,:user_id,:block)
end


end