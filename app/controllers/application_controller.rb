class ApplicationController < Spina::ApplicationController
  protect_from_forgery with: :exception

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
