module ApplicationHelper

# renderers

  def link_to_user (user)
    render html:"<a href='#{user_path(user.id)}'>#{user.username}</a>".html_safe
  end


  def icon (name)
    render html:"<span class='glyphicon glyphicon-#{name}'></span>".html_safe
  end

  def error_message (hash)
    message = ""
    hash.each do |m|
      message += "#{m}<br>"
    end
    return message
  end

  def hint (text)
    render html: "<p class='hint'>#{text}</p>".html_safe
  end

  def active? (urls)
    urls.each do |url|
      if current_page?("#{url}")
        return 'active' 
      end
    end
  end

# renderers END

  def user_by_id (id)
    User.find(id)
  end

end
