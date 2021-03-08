class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.where(user_id: current_user.id)
  end

  def friends
    @friendships = Friendship.where(user_id: current_user.id, status: true)
  end

  def create
    new_friend_id = params[:friend_id]
    @friendship = Friendship.find_or_initialize_by(user_id: current_user.id, friend_id: new_friend_id, status: false)
    @inverse_friendship = Friendship.find_or_initialize_by(user_id: new_friend_id,
                          friend_id: current_user.id, status: false)
    if @friendship.save && @inverse_friendship.save
      flash[:notice] = 'You sent a friend request..'
    else
      flash[:alert] = 'Something wrong happened...'
    end
    redirect_to users_path
  end

  def update
    new_friend_id = params[:friend_id]
    @friendship = Friendship.where(user_id: current_user.id, friend_id: new_friend_id)
    @inverse_friendship = Friendship.where(user_id: new_friend_id, friend_id: current_user.id)
    if @friendship.update_all(status: true) && @inverse_friendship.update_all(status: true)
      flash[:notice] = 'You have a new a friend!'
    else
      flash[:alert] = 'Something wrong happened...'
    end
    redirect_to friendships_path
  end

  def destroy
    new_friend_id = params[:friend_id]
    @friendship = Friendship.find_by(user_id: current_user.id, friend_id: new_friend_id)
    @inverse_friendship = Friendship.find_by(user_id: new_friend_id, friend_id: current_user.id)
    if Friendship.destroy(@friendship.id) && Friendship.destroy(@inverse_friendship.id)
      flash[:notice] = 'You refused the request!'
    else
      notice[:alert] = 'Something wrong happened...'
    end
    redirect_to friendships_path
  end
end
