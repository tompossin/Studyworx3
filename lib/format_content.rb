# == Formatting Module
#
# This module contains methods for converting text to various formats
module FormatContent
  
  # This method converts html content into various formats
  # * Formats: pdf, docx, doc, odt, rtf, md
  # * I am converting the content to an html string first because it seems to do a better job overall.
  #   * This allows me to flush the raw data through a template first. Not perfectly railsy but close.
  def convert_file(content,user_id,filename,format)
    Dir.glob("tmp/docs/#{user_id}*") do |my_file|
      File.delete(my_file)
    end
    new_file_name = "#{user_id}_#{filename}.#{format}"
    Tempfile.open(['pandoc','.html'], Rails.root.join('tmp/docs') ) do |f|
      f.print(content)
      f.flush
      system("pandoc -s -S #{f.path} -o tmp/docs/#{new_file_name}")
      f.unlink
    end
    return {filename: new_file_name, filepath: "tmp/docs/#{new_file_name}" }   
  end
  
  # This converts Markdown to Html
  # This is what powers the views it does a better job than pandoc on Markdown
  def markdown_to_html(content)
    render_options = {hard_wrap: true, filter_html: true, safe_links_only: true}
    markdown_options = {no_intraemphasis: true, autolink: true, superscript: true, fenced_code_blocks: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options),markdown_options)
    return markdown.render(content).html_safe
  end
  
  # This converts html to markdown at this point I use this for switching editors
  def html_to_markdown(content)
    filenumber = current_user.id
    filename = filenumber.to_s+".html"
    %x["touch #{filename}"]
    File.atomic_write("tmp/#{filename}") do |file|
      file.write(content)
    end
    html_content = `pandoc -f html -t markdown "tmp/#{filename}"`
    File.delete("tmp/#{filename}")
    return html_content
  end
  
  
  
end
