module ChartsHelper
  
  def get_class(type=0)
    if type == 1
      "paragraph_title"
    elsif type == 2
      "segment_title"
    elsif type == 3
      "section_title"
    elsif type == 4
      "division_title"
    elsif type == 5
      "book_title"
    else
      "bad_title"
    end
  end
  
end
