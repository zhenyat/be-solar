class Admin::TreeController  < Admin::BaseController

  def index
    @items_tree = Category.all.arrange
    # @category_roots = Category.roots.order(:position)
  end
end
