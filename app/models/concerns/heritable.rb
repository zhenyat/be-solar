################################################################################
#   If gem 'ancestry' is applied
#
#   Examples:
#     women = Category.create(name: 'Women')
#     women_bags = Category.create(name: 'Bags', parent: women)
#     women_clothes = Category.create(name: 'Clothes', parent: women)
#   26.12.2020  ZT
################################################################################
module Heritable
  extend ActiveSupport::Concern

  included do
    has_ancestry
  # scope :visible, lambda {where("visible = ?", true AND "parent.visible =?", true) }
    # scope :visible, -> {where(visible: true)}
  # scope :is_visible, -> {where(id: Category.pluck(:ancestry).compact.map { |e| e.split('/') }.flatten.uniq)}
    # scope :is_child, -> {where(parent.present?)}
  # scope :visible, lambda { |category| joins(:client).where("clients.user_id = ?", user.id) }
    # scope :visible, -> {where(visible: true, self.parents_visible: true)}

    # scope :with_client_id_and_age, lambda { |params| where(:client_id => params[:client_id], :age => params[:age]) }
    # Offer.with_client_id_and_age( { client_id: client_id, age: age } )

    before_validation do
      self.ancestry = nil if self.ancestry.blank?
    end

    def visible_in_tree()
      return(false) if !self.visible
      if self.ancestors?
        self.ancestors.each do |ancestor|
          return(false) if !ancestor.visible?
        end
      else  # just a root 
        return true
      end
      return true
    end

    # def parents_visible()
    #   if self.ancestors?
    #     self.ancestors.each do |ancestor|
    #       return(false) if !ancestor.visible?
    #     end
    #   else  # just a root  
    #     return true
    #   end
    #   return true
    # end
  end
end