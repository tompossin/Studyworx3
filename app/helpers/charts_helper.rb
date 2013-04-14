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
  
  def name_cleaner(raw_string)
    return raw_string.gsub(/[^A-Za-z0-9_\-\.]/, '_')
  end
  
  # This takes the same arguments as image_tag but produces a full url to the image.
  def absolute_image_tag(*args)
    raw(image_tag(*args).sub /src="(.*?)"/, "src=\"#{request.protocol}#{request.host_with_port}" + '\1"')
  end
  
  def get_chart_image(user,task,title=nil,type)
    if type == "horizontal"
      filename = "#{user.id.to_s}_#{task.assignment.name}_horizontal.jpg"
    else
      filename = "#{user.id.to_s}_#{task.assignment.name}_vertical_#{title.segnum.to_s}.jpg"
    end
    filename = name_cleaner(filename)   
    return absolute_image_tag("/images/#{filename}",{style: "float:right;"})
  end
  
end
