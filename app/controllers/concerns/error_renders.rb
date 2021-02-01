# app/controllers/concerns/error_renders.rb
module ErrorRenders
  extend ActiveSupport::Concern

  def render_404
    return head :not_found if request.xhr?

    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
      format.any  { head :not_found }
    end
  end

  def render_500
    return head :internal_server_error if request.xhr?

    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500.html", layout: false, status: :internal_server_error }
      format.any  { head :internal_server_error }
    end
  end
end
