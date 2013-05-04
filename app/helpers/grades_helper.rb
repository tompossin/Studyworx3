module GradesHelper
  
  # This converts numeric grades to letter grades.
  def letter_grade(number_grade)
    if number_grade
      if number_grade > 97
        "A+"
      elsif number_grade > 92
        "A"
      elsif number_grade > 89
        "A-"
      elsif number_grade > 87
        "B+"
      elsif number_grade > 82
        "B"
      elsif number_grade > 79
        "B-"
      elsif number_grade > 77
        "C+"
      elsif number_grade > 72
        "C"
      elsif number_grade > 69
        "C-"
      elsif number_grade > 67
        "D+"
      elsif number_grade > 62
        "D"
      elsif number_grade > 59
        "D-"
      else
        "F"
      end
    else
      "Pending"
    end
  end
  
  def get_staffnote_url(noteable_type, noteable_id)
    if noteable_type == "Document"
      document_staffnote_path(noteable_id)
    elsif noteable_type == "Ppoint"
      ppoint_staffnote_path(noteable_id)
    elsif noteable_type == "Title"
      title_staffnote_path(noteable_id)
    elsif noteable_type == "Charttext"
      charttext_staffnote_path(noteable_id)
    elsif noteable_type == "Comment"
      comment_staffnote_path(noteable_id)
    else
      ""
    end
  end
  
end
