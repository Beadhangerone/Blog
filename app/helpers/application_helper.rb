module ApplicationHelper

  def link_to_user (user)
    render html:"<a href='#{user_path(user.id)}'>#{user.username}</a>".html_safe
  end

  def user_by_id (id)
    User.find(id)
  end

end
