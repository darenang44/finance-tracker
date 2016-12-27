class FriendshipsController < ApplicationController

  def destroy
    # to get @friendship we have to look at the current_user's friendships then find the friend_id that matches the id where we hit the unfriend button 
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    redirect_to my_friends_path, notice: "Friend was successfully removed."
  end

end
