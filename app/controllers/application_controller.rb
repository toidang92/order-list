class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Inside your protected controller
  before_action :authenticate_user!

  include ErrorRenders

  rescue_from StandardError do |e|
    if Rails.env.development?
      raise e
    else
      if request.xhr?
        head :internal_server_error
      else
        render_500
      end

      logger.error e.message
      ExceptionNotifier.notify_exception(e, env: request.env)
    end
  end
end
