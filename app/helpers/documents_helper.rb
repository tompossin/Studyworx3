module DocumentsHelper
  
  # Creates a link for printing documents
  def document_print_link(task)
    if task.task_type == 1
      return link_to( "print", document_print_path(task),{title: "Show a printable version"})
    elsif task.task_type == 2
      return link_to("print", print_task_comments_path(task),{title: "Show a printable version"})
    elsif task.task_type == 3 
      return link_to( "print", task_print_charts_path(task),{title: "Show a printable version"})
    else
      return link_to(image_tag("iconic/denied_16x16.png",size: "16x16"))
    end
  end
  
  def document_pdf_link(task)
    if task.task_type == 1
      return link_to( "pdf", document_download_path(task,file_type: "pdf"),{title: "Download a pdf version"})
    elsif task.task_type == 2
      return link_to("pdf", print_task_comments_path(task,format: :pdf),{title: "Download a pdf version"})
    elsif task.task_type == 3
      return link_to( "pdf", task_print_charts_path(task,format: :pdf),{title: "Download a pdf version"})
    else
      return link_to(image_tag("iconic/denied_16x16.png",size: "16x16"))
    end
  end
  
  def document_odt_link(task)
    if task.task_type == 1
      return link_to( "odt", document_download_path(task, file_type: "odt"),{title: "Download an Open Document version"})
    elsif task.task_type == 2
      return link_to( "odt", download_task_comments_path(task, file_type: "odt"),{title: "Download Open Document format"})
    elsif task.task_type == 3
      return link_to( "odt", task_download_charts_path(task,file_type: "odt"),{title: "Download an Open Document version"})
    else
      return link_to(image_tag("iconic/denied_16x16.png",size: "16x16"))
    end
  end
  
  def document_docx_link(task)
    if task.task_type == 1
      return link_to( "docx", document_download_path(task, file_type: "docx"),{title: "Download a docx version"})
    elsif task.task_type == 2
      return link_to("docx", download_task_comments_path(task,file_type: "docx"))
    elsif task.task_type == 3
      return link_to( "docx", task_download_charts_path(task,file_type: "docx"),{title: "Download a docx version"})
    else
      return link_to(image_tag("iconic/denied_16x16.png",size: "16x16"))
    end
  end
end
