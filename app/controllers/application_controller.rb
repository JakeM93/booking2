
class ApplicationController < ActionController::Base
  console
  add_flash_types :info, :error, :warning, :success
  include Authentication

  def logging(log: '', location: :local)
    location == :local ? (logger.debug log.to_s + @user.inspect) : return
  end
end