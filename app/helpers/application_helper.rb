module ApplicationHelper
  
  def page_title(app_title, title)
    if title.present?
      [app_title, title].join(" | ")
    else
      app_title
    end
  end
end
