class LinkGenerator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  def initialize(request, title, path, html_options = {}, options = {})
    @request      = request
    @title        = title
    @path         = path
    @html_options = html_options
    @options      = options
  end

  def to_html
    html = link

    if @options[:wrapper]
      html = content_tag(@options[:wrapper], html, class: wrapper_classes)
    end

    html.html_safe
  end

  private

  def current_path
    comparable_path_for(@request.fullpath)
  end

  def link_path
    comparable_path_for(url_for(@path))
  end

  def segment_position
    if @options[:controller_segment]
      @options[:controller_segment] - 1
    elsif @options[:url_segment]
      @options[:url_segment]
    end
  end

  def path_controller
    controller_for(@path)
  end

  def current_controller
    controller_for(@request.path)
  end

  def segment_for(controller, path)
    if @options[:controller_segment]
      controller.split('/')[segment_position]
    elsif @options[:url_segment]
      path.split('/')[segment_position]
    end
  end

  def path_segment
    segment_for(path_controller, current_path)
  end

  def current_segment
    segment_for(current_controller, link_path)
  end

  def paths_match?
    current_path == link_path
  end

  def segments_match?
    path_segment && path_segment == current_segment
  end

  def selected?
    paths_match? || segments_match?
  end

  def selected_class
    @options[:selected_class] || 'active'
  end

  def link_classes
    return @html_options[:class] if @options[:wrapper]
    "#{@html_options[:class]} #{selected_class}"
  end

  def html_options
    selected? ? @html_options.merge(class: link_classes) : @html_options
  end

  def link
    link_to(@title, @path, html_options)
  end

  def wrapper_classes
    if selected?
      "#{@options[:wrapper_class]} #{selected_class}"
    else
      @options[:wrapper_class]
    end
  end

  def controller_for(path)
    Rails.application.routes.recognize_path(path)[:controller]
  end

  def comparable_path_for(path)
    if @options[:ignore_params]
      path.gsub(/\?.*/, '')
    else
      path
    end
  end
end
