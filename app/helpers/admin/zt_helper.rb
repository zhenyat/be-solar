module Admin::ZtHelper

  # Selects a hot mark to be displayed
  def hot_mark hot
    if hot 
      image_tag('admin/check_mark.png', size: '12x15', alt: 'True')
    else
      image_tag('admin/minus_mark.png', size: '12x15', alt: 'False')
    end
  end
  
  
  # Excludes Model attributes from show
  def show_attribute? key
    if (key == 'id' || key.include?('digest') || key == 'created_at' || key == 'updated_at' || key == 'cover_image_url')
      return false
    end
    return true
  end

  # Sorts array of objects by the Attribute (if passed)
  def sort_objects objects_array, attribute=nil
    if attribute.nil?
      objects_array
    else
      objects_array.sort! { |a,b| eval("a.#{attribute} <=> b.#{attribute}") }
    end
  end

  # Selects a status mark to be displayed
  def status_mark status
    if status == 'active'
      image_tag('admin/check_mark.png', size: '12x15', alt: 'Active')
    else
      image_tag('admin/minus_mark.png', size: '12x15', alt: 'Archive')
    end
  end

  # Selects a visibility mark to be displayed
  def visibility_mark visibility
    if visibility 
      image_tag('admin/check_mark.png', size: '12x15', alt: 'True')
    else
      image_tag('admin/minus_mark.png', size: '12x15', alt: 'False')
    end
  end
end
