module ApplicationHelper
  def menu_item(path, title)
    if current_page?(path)
      link_to "<li>#{title}</li>".html_safe, path, class: "menu-links-active"
    else
      link_to "<li>#{title}</li>".html_safe, path
    end
  end
end
