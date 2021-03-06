module Admin::TreeHelper
  def nested_groups(groups)
    content_tag(:ul) do
      groups.map do |group, sub_groups|
        link_to(         
          (content_tag(:span, ("#{group.title} (#{group.id}/#{group.position}: #{group.name} - #{group.visibility})"), 
                       class: group_classes(group)) + nested_groups(sub_groups)
          ).html_safe, [:admin, group])
      end.join.html_safe
    end
  end

  def group_classes(group)
    group_classes = ''
    group_classes << 'visible' if group.visible_in_tree
    group_classes << ' archived' if group.archived?
    group_classes
  end

  # ==== Version 2: obsolete
  def ancestry_nested_nodes_tree(nodes) # nodes to be roots!
    content_tag :ul do
      nodes.each do |node|
        concat(content_tag(:li, "#{node.title}  (#{node.id}. #{node.name} /#{node.position})", class: ('visible' if (node.visibility and all_ancestors_are_visible?(node))))).html_safe
        if node.has_children? 
          concat(ancestry_nested_nodes_tree(node.children.order(:position))).html_safe
        end
      end.join.html_safe
    end
  end

  def all_ancestors_are_visible?(node)
    node.ancestors.each do |a|
      return false if !a.visibility?
    end
    return true
  end
  # ====
end
