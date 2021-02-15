class Api::V1::CategoriesController < Api::ApiController
  include ImagesUrl

  def index
    categories = Category.roots.visible.order(:position)
    # categories = Category.roots.active.order(:position)
    categories.each {|c| c.cover_image_url = cover_image_url(c)}

    render json: categories
  end
end