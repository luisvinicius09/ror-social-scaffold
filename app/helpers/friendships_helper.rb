module FriendshipsHelper
  def friends_btn(current, id)
    link_to 'Friends', friends_path, class: 'btn' unless current != id
  end

  def who_send(fsp)
    user1 = Friendship.find_by(user_id: fsp.user_id, friend_id: fsp.friend_id)
    user2 = Friendship.find_by(user_id: fsp.friend_id, friend_id: fsp.user_id)
    user1.id > user2.id
  end

  def friends
    req_friends = current_user.friendships.map(&:friend)
    accepted_friends = current_user.friendships.map(&:user)
    req_friends.compact + accepted_friends.compact
  end
end
