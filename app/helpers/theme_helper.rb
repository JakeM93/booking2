module ThemeHelper

  # set theme based on us
  def object_theme(object, user = nil)
    set_theme = user.present? ? user.theme : 'default'
    return "#{object.downcase}-#{set_theme.downcase}"
  end
end