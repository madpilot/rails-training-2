# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_message(type)
    flash[type] || ''
  end
end
