module ApplicationHelper
  def bootstrap_devise_error_messages!
    bootstrap_error_messages!(resource)
  end

  def bootstrap_error_messages!(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |message| content_tag(:li, message) }.join

    sentence = I18n.t(
      'errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase
    )

    html = <<~HTML
      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <p class="alert-heading h5">#{sentence}</h4>
        <ul class="mb-0">#{messages}</ul>
      </div>
    HTML

    html.html_safe
  end

  def enum_for_select(enums)
    enums.keys
  end
end
