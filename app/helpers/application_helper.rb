module ApplicationHelper
  def alert_type(type)
    type.downcase
    case type
    when 'info'
      'alert-primary'
    when 'error'
      'alert-danger'
    when 'success'
      'alert-success'
    when 'warning'
      'alert-warning'
    else
      'alert-warning'
    end
  end

  def feature_enabled?(key, school: nil, user: nil)
    Flipper[key].enabled? || Flipper[key].enabled?(school) || Flipper[key].enabled?(user)
  end
end
