module ApplicationHelper
  def authentication_helper
    if current_user.is_a?(User) 
      button_to  'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'register', new_user_registration_path) +
      "<br>".html_safe +
      (link_to 'login', new_user_session_path) 
    end 
  end

  def source_hepler(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end 
  end
end
