module NavHelper
  def nav_link_status(*args, &block)
    sidebar_class = { wrapper: :li }

    if block_given?
      args[2] = (args[2] || {}).merge(sidebar_class)
    else
      args[3] = (args[3] || {}).merge(sidebar_class)
    end

    nav_link(*args, &block)
  end

  def nav_link(*args, &block)
    title = block_given? ? capture(&block) : args.shift
    path         = args[0]
    html_options = args[1] || {}
    options      = args[2] || {}

    LinkGenerator.new(request, title, path, html_options, options).to_html
  end
end
