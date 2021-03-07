class FriendshipsController < ApplicationController
  def index
  end
  
  def create
    new_friend_id = params[:friend_id]
    @friendship = Friendship.find_or_initialize_by(user_id: current_user.id, friend_id: new_friend_id, status: false)
    @inverse_friendship = Friendship.find_or_initialize_by(user_id: new_friend_id, friend_id: current_user.id, status: false)
    if @friendship.save && @inverse_friendship.save
      flash[:notice] = 'You sent a friend request..'
    else
      flash[:alert] = 'Something wrong happened'
    end
    redirect_to users_path
  end

  def update
  end

  def destroy
  end
end
