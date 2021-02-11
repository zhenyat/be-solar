module Admin::TreeHelper
  def nested_groups(groups)
    content_tag(:ul) do
      groups.map do |group, sub_groups|
        content_tag(:li, ("#{group.title} (#{group.id}/#{group.position}: #{group.name} - #{group.visible})").html_safe, 
                         class: ('visible' if group.visible_in_tree)) + nested_groups(sub_groups)
      end.join.html_safe
    end
  end

  # ==== Version 2: obsolete
  def ancestry_nested_nodes_tree(nodes) # nodes to be roots!
    content_tag :ul do
      nodes.each do |node|
        concat(content_tag(:li, "#{node.title}  (#{node.id}. #{node.name} /#{node.position})", class: ('visible' if (node.visible and all_ancestors_are_visible?(node))))).html_safe
        if node.has_children? 
          concat(ancestry_nested_nodes_tree(node.children.order(:position))).html_safe
        end
      end.join.html_safe
    end
  end

  def all_ancestors_are_visible?(node)
    node.ancestors.each do |a|
      return false if !a.visible?
    end
    return true
  end
  # ====
end
