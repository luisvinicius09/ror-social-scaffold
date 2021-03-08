module UsersHelper
  def request_button(current, id)
    if current != id
      render 'friendships/request'
    end
  end

  def friendship_link(current, id)
    if current == id
      link_to 'Friendship requests', friendships_path, class: 'btn'
    end
  end
  
  def friends()
    link_to 'Friends', friends_path, class: 'btn'
  end
end