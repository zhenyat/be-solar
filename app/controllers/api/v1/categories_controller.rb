class Api::V1::CategoriesController < Api::ApiController
  include ImagesUrl

  def index
    categories = Category.roots.visible.order(:position)
    # categories = Category.roots.active.order(:position)
    categories.each {|c| c.cover_image_url = cover_image_url(c)}

    render json: categories
  end

  def show
    category = Category.find(params[:id])
    category.cover_image_url = cover_image_url(category)
    # render json: category

    if category.children?
      sub_categories = category.children.active.visible.order(:position)
      sub_categories.each {|c| c.cover_image_url = cover_image_url(c)}
      render json: sub_categories
    else
      products = category.products.active.order(:position)
      products.each {|p| p.cover_image_url = cover_image_url(p)}
      render json: products
    end
  end

  # def children_index
  #   if @category.children?
  #     @category.children
  #     @sub_categories = @category.children.active.visible.order(:position)
  #   end
  # end
end