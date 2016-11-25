module ApplicationHelper

  def link_to_user (user)
    render html:"<a href='#{user_path(user.id)}'>#{user.username}</a>".html_safe
  end

  def user_by_id (id)
    User.find(id)
  end

  def icon (name)
    render html:"<span class='glyphicon glyphicon-#{name}'></span>".html_safe
  end

end
