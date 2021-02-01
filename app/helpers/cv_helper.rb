module CvHelper
  def progress_bar(text = nil, current: 0, min: 0.0, max: 100.0)
    content_tag(:span, text).concat(
      content_tag(:div, class: 'progress progress-sm') do
        content_tag(:div, nil,
                     class: "progress-bar bg-warning",
                     'role' => 'progressbar',
                     'aria-valuemax' => max,
                     'aria-valuemin' => min,
                     'aria-valuenow' => current,
                     'style' => "width: #{ current/max  * 100 }%")
      end
    )
  end
end
