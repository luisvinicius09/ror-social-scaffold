class FriendshipController < ApplicationController
  def create
    new_friend_id = params[:user_id]
    @friendship = Friendship.find_or_initialize_by(user_id: current_user.id, friend_id: new_friend_id, status: false)
    if @friendship.save
      flash[:notice] = 'Now you attended to this event.'
    else
      flash[:alert] = 'Something wrong happened'
    end
    redirect_to root_path
  end

  def accept_friend(user)
  end
end
