module UsersHelper
  def request_button(current, id)
    render 'friendships/request' unless current == id
  end

  def friendship_link(current, id)
    link_to 'Friendship requests', friendships_path, class: 'btn' unless current != id
  end

  def friends(current, id)
    link_to 'Friends', friends_path, class: 'btn' unless current != id
  end
end
