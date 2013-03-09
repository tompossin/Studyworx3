# ### Formatting Module
# This module contains methods for converting text to various formats
module FormatContent
  

  # This convert Markdown to Html
  def markdown_to_html(content)
    render_options = {hard_wrap: true, filter_html: true, safe_links_only: true}
    markdown_options = {no_intraemphasis: true, autolink: true, superscript: true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options),markdown_options)
    return markdown.render(content).html_safe
  end
  
  def html_to_markdown(content)
    filenumber = current_user.id
    filename = filenumber.to_s+".html"
    %x["touch #{filename}"]
    File.atomic_write("tmp/#{filename}") do |file|
      file.write(content)
    end
    
    html_content = `pandoc -f html -t markdown tmp/#{filename}`
    File.delete("tmp/#{filename}")
    return html_content
  end
  
end
