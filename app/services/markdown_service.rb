class MarkdownService
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       footnotes: true,
                                       autolink: true,
                                       tables: true)

  def convert(md)
    md.present? ? @@markdown.render(md) : ''
  end
end