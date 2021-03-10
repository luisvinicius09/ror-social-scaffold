module FriendshipsHelper
  def who_send(fs)
    user1 = Friendship.find_by(user_id: fs.user_id, friend_id: fs.friend_id)
    user2 = Friendship.find_by(user_id: fs.friend_id, friend_id: fs.user_id)
    user1.id > user2.id
  end
end
