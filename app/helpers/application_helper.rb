module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      filter_html: true
    }
    extensions = {
      autolink: true,
      tables: true,
      underline: true,
      highlight: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)
    @markdown.render(text).html_safe
  end

  def markdown_for_index(text)
    options = {
      hard_wrap: true,
      filter_html: true
    }
    extensions = {
      autolink: true,
      tables: true,
      underline: true,
      highlight: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    @markdown_index ||= Redcarpet::Markdown.new(renderer, extensions)
    @markdown_index.render(text).html_safe
  end

end
