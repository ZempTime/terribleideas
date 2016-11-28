module ApplicationHelper
  def active?(active_class, opts={})
    current = {}; current[:controller] = params[:controller]; current[:action] = params[:action]
    current.keep_if {|key, value| opts.has_key?(key)}

    if opts == current
      active_class
    else
      ""
    end
  end
end
