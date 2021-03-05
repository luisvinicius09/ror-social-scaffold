module UsersHelper
  def request_button(current, id)
    if current != id
      render 'friendship/request'
    end
  end
end