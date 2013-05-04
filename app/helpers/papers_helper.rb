module PapersHelper
  
  def get_published_state(p)
    if p.draft == false and p.published == false
      "Private"
    elsif p.draft == true and p.published == false
      "Ready for Review"
    elsif p.published == true
      "Published"
    else
      "Nope"
    end
  end
  
end
