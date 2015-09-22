module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(no_images: true, hard_wrap: true), autolink: true, tables: true, hard_wrap: true, filter_html: true, no_intra_emphasis: true)
    markdown.render(text).html_safe
  end
end
