module WelcomeHelper
  
  def selected_if(condition)
    if condition
      'selected'
    else
      nil
    end
  end
end
