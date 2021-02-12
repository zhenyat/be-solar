class Admin::TreeController  < Admin::BaseController

  def index
    @items_tree = Category.all.order(:position).arrange
    # @category_roots = Category.roots.order(:position)
  end
end
