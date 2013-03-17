module DocumentsHelper
  
  # Creates a link for printing documents
  def document_print_link(task)
    if task.task_type == 1
      return link_to( "print", document_print_path(task),{title: "Show a printable version"})
    else
      return link_to "n/a"
    end
  end
  
  def document_pdf_link(task)
    if task.task_type == 1
      return link_to( "pdf", document_download_path(task,file_type: "pdf"),{title: "Download a pdf version"})
    else
      return link_to "n/a"
    end
  end
  
  def document_odt_link(task)
    if task.task_type == 1
      return link_to( "odt", document_download_path(task, file_type: "odt"),{title: "Download an odt version"})
    else
      return link_to "n/a"
    end
  end
  
  def document_docx_link(task)
    if task.task_type == 1
      return link_to( "docx", document_download_path(task, file_type: "docx"),{title: "Download a docx version"})
    else
      return link_to "n/a"
    end
  end
end
