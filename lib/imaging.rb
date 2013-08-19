module Imaging

require 'rvg/rvg'
include Magick
protected
  
  # This removes non-alphanumeric characters to make legal filenames.
  def name_cleaner(raw_string)
    return raw_string.gsub(/[^A-Za-z0-9_\-\.]/, '_')
  end
  
  def clear_images(user_id)
    Dir.glob("public/images/#{user_id.to_s}*") do |my_file|
      File.delete(my_file)
    end
  end

  def build_standard_horizontal(task_id,user_id)
    clear_images(user_id)
    user = User.find(user_id)
    task = Task.find(task_id)
    titles = Title.where("task_id = ? and user_id = ?",task_id,user_id).all
    total_verses = Title.sum(:verse_count, :conditions=>['task_id=? and user_id=? and title_type=?',task_id,user_id,1])
    total_segments = Title.count(:all, :conditions=>['task_id=? and user_id=? and title_type=?',task_id,user_id,2])
    total_sections = Title.count(:all, :conditions=>['task_id=? and user_id=? and title_type=?',task_id,user_id,3])
    total_divisions = Title.count(:all, :conditions=>['task_id=? and user_id=? and title_type=?',task_id,user_id,4])
    sz = "small" if total_segments < 8
    size = sz || "large" 
      # Begin Processing image
      Magick::RVG.dpi = 96
      # Set image size
      i_width = 900
      i_height = 1200
      pu_height = 1199.0 # this is an adjustment so the bottom border shows (needs .0 to make it a float)
      # Set initial vertical starting points
      y_1 = 0
      y_2 = 0
      y_3 = 0
      y_4 = 0
      y_5 = 0
      # Set vertical height default increment
      height_pixel_unit = pu_height/total_verses
      # Create blank new image
      rvg = RVG.new(i_width, i_height) do |canvas|
        canvas.background_fill = 'white'
        # Iterate through all titles
        for title in titles
          if title.title_type == 1
            # if paragraph title
            unless size == "large"
              height = title.verse_count*height_pixel_unit
              canvas.g do |ptitle|
                ptitle.rect(300, height, 0, y_1).styles(:fill =>'transparent', :stroke => 'black', :stroke_width=>'1')
                ptitle.text(4, y_1+12,title.title)
              end
              # increment the vertical starting point for the next paragraph title
              y_1 += height
            end
          elsif title.title_type == 2
            # if segment title
            unless size == "large"
              height = (title.verse_count*height_pixel_unit)
              text_anchor = height/2
              x_anchor = 300
              canvas.g do |seg|
                seg.rect(100,height,300,y_2).styles(:fill =>'transparent', :stroke => 'black', :stroke_width=> '1')
                if height < 225
                  title.title.split(" ").each {|t|
                    seg.text(x_anchor+80,y_2+text_anchor,t).rotate(90).styles(:font_size=>12,:font_weight=>'bold',:text_anchor=>'middle')
                    x_anchor -= 12
                  }  
                else
                  seg.text(x_anchor+80,y_2+text_anchor,title.title).rotate(90).styles(:font_size=>14,:font_weight=>'bold',:text_anchor=>'middle')
                end            
              end     
            else
              height = title.verse_count*height_pixel_unit
              canvas.g do |ptitle|
                ptitle.rect(300, height, 0, y_2).styles(:fill =>'transparent', :stroke => 'black', :stroke_width=>'1')
                ptitle.text(4, y_2+12,title.title)
              end
            end
            # increment the vertical starting point for the next segment title
            y_2 += height
          elsif title.title_type == 3
            # if section title
            height = title.verse_count*height_pixel_unit
            text_anchor = height/2
            x_anchor = 400
            x_anchor -= 100 if size == "large"
            canvas.g do |sec|
              sec.rect(100,height,x_anchor,y_3).styles(:fill =>'transparent',:stroke=>'black', :stroke_width=> '1')
              if height < 225
                title.title.split(" ").each {|t|
                  sec.text(x_anchor+80,y_3+text_anchor,t).rotate(90).styles(:font_size=>12,:font_weight=>'bold',:text_anchor=>'middle')
                  x_anchor -= 12
                }
              else
                sec.text(x_anchor+80,y_3+text_anchor,title.title).rotate(90).styles(:font_size=>14,:font_weight=>'bold',:text_anchor=>'middle')
              end
              
            end
            # increment the vertical starting point for the next section title
            y_3 += height
          elsif title.title_type == 4
            # if division title
            x_anchor = 500
            if total_sections == 0
              x_anchor = 400
            end
            x_anchor -= 100 if size == "large"
            height = title.verse_count*height_pixel_unit
            text_anchor = height/2
            canvas.g do |div|
              div.rect(100,height,x_anchor,y_4).styles(:fill =>'transparent',:stroke=>'black', :stroke_width=> '1')
              if height < 225
                title.title.split(" ").each {|t| # This method does not exist
                  div.text(x_anchor+80,y_4+text_anchor,t).rotate(90).styles(:font_size=>12,:font_weight=>'bold',:text_anchor=>'middle')   
                  x_anchor -= 12
                }
              else
                div.text(x_anchor+80,y_4+text_anchor,title.title).rotate(90).styles(:font_size=>16,:font_weight=>'bold',:text_anchor=>'middle')
              end   
            end
            # Increment the vertical starting point for the next division
            y_4 += height
          elsif title.title_type == 5
            # if Book title
            x_anchor = 600
            width = 298
            if total_sections == 0
              x_anchor -= 100
              width += 100
            end
            if total_divisions == 0
              x_anchor -= 100
              width += 100
            end
            if size == "large"
              x_anchor -= 100
              width += 100
            end
            height = title.verse_count*height_pixel_unit
            text_anchor = 10
            text_position = x_anchor + width - 40
            canvas.g do |div|
              div.rect(width,height,x_anchor,y_5).styles(:fill =>'transparent',:stroke=>'black', :stroke_width=> '1')
              div.text(text_position.to_i,text_anchor,title.title).rotate(90).styles(:font_style=>'italic',:font_size=>28,:font_weight=>'bold')
              div.text(text_position.to_i-24,15,user.fullname+" - "+Time.now.to_s(:long)).rotate(90).styles(:font_style=>'italic',:font_size=>10,:font_weight=>'bold')
            end            
          end
        end
      end 
      
      # Image Creation complete
      aname = name_cleaner(task.assignment.name)
      img_path = 'public/images/'
      FileUtils.mkpath img_path
      id = user_id.to_s 
      rvg.draw.scale(0.65).write(img_path+id+'_'+aname+'_horizontal.jpg')
      rvg.draw.destroy!
  end
  
  # FIXME I need to create an error correction system
  # either here or in the controller or both to deal with a nil observation.
  def build_standard_vertical(task,user_id,title_id)
    max_verses = Title.maximum(:verse_count,:conditions=>['task_id=? AND user_id=? AND title_type=?',task.id,user_id,2])
    vertical_units = 1200/max_verses
    segment = Title.find(title_id)
    ptitles = segment.children
    # set default variables
    total_height = segment.verse_count.to_f*vertical_units.to_f
    header_height = 55
    y_2 = header_height # Vertical starting point (This starts the ptitles just below the header
    i_width = 301 
    i_center = 150
    i_height = total_height + header_height + 1 # the 1 extra pixel is for the border or it gets cut off
    # Begin creating the image
    Magick::RVG.dpi = 96
    rvg = RVG.new(i_width, i_height) do |canvas|
      canvas.background_fill = 'white'
      # Create header
      canvas.g do |h|
        h.rect(300,header_height,0,0).styles(:fill=>'white',:stroke=>'black',:stroke_width=>'1')
        vert = 16
        ha = segment.title.split('.')
        ha.each{|hh|
          h.text(i_center,vert,hh).styles(:font_style=>'italic',:font_size=>14,:font_weight=>700,:text_anchor=>'middle')
          vert += 16
        }
        
        #h.text(4,32,segment.verse_ref).style(:font_style=>'italic',:font_size=>14)
      end
      # Create Titles
      for pt in ptitles
        height = pt.verse_count*vertical_units
        canvas.g do |t|
          t.rect(300,height,0,y_2).styles(:fill=>'white',:stroke=>'black',:stroke_width=>'1')
          t.text(4, y_2+12,pt.title).styles(:font_size=>11,:font_style=>'italic',:font_weight=>700)
        end
        # Create ppoints for each paragraph title
        t_2 = y_2+22
        for pp in pt.ppoints
          o = Observation.find(pp.observation_id) if pp.observation_id          
          canvas.g do |p|
            content = pp.content
            content = o.code+" "+pp.content if o
            content = content.split(/\n/)
            content.each{|e|
              p.text(i_center,t_2,e).styles(:font_size=>10,:font_style=>'normal',:font_weight=>400,:text_anchor=>'middle',:fill=>pp.color)
              t_2 += 11
            }                       
          end
        end
        y_2 += height
      end      
    end 
    
    # Image built now write it to file
    aname = name_cleaner(task.assignment.name)
    img_path = 'public/images/'
    id = user_id.to_s
    FileUtils.mkpath img_path
    rvg.draw.scale(0.70).write(img_path+id+'_'+aname+'_vertical_'+segment.segnum.to_s+'.jpg')
    rvg.draw.destroy!
  end
  
  def build_all_verticals(task_id,user_id)
    task = Task.find(task_id)
    segments = Title.where("task_id = ? and user_id = ? and title_type = ?",task_id,user_id,2).all
    segments.each do |s|
      build_standard_vertical(task,user_id,s.id)
    end
  end
  
  def build_all_charts(task_id,user_id)
    task = Task.find(task_id)
    build_standard_horizontal(task_id,user_id)
    build_all_verticals(task_id,user_id)
  end
  
  def zip_all_charts(task_id,user_id)
    task = Task.find(task_id)
    build_all_charts(task_id,user_id)
    system("zip public/images/#{user_id.to_s}_#{task.assignment.name} public/images/#{user_id.to_s}*")
  end
  
end
