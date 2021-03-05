class FriendshipsController < ApplicationController
  def create
    new_friend_id = params[:friend_id]
    @friendship = Friendship.find_or_initialize_by(user_id: current_user.id, friend_id: new_friend_id, status: false)
    if @friendship.save
      flash[:notice] = 'You sent a friend request..'
    else
      flash[:alert] = 'Something wrong happened'
    end
    redirect_to users_path
  end

  def accept_friend(user)
  end
end