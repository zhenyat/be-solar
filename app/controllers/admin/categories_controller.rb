class Admin::CategoriesController < Admin::BaseController
  before_action :set_category,   only: [:show, :edit, :update, :destroy]
  before_action :positions_swap, only: :update
  after_action  :remove_images,  only: :update

  def index
    @categories = policy_scope(Category)
  end

  def show
    authorize @category
  end

  def new
    @category = Category.new
    authorize @category
  end

  def edit
    parent = @category.parent
    authorize @category
  end

  def create
    parent = Category.find_by id: category_params[:parent]
    updated_params = category_params
    updated_params[:parent] = parent        # Thus provides correct attribute 'ancestry'
    @category = Category.new(updated_params)
    authorize @category

    if @category.save
      flash[:success] = t('messages.created', model: @category.class.model_name.human)
      redirect_to [:admin, @category]
    else      
      render :new
    end
  end

  def update
    parent = Category.find_by id: category_params[:parent]
    updated_params = category_params
    updated_params[:parent] = parent        # Thus provides correct attribute 'ancestry'
    authorize @category

    if @category.update(updated_params)
      flash[:success] = t('messages.updated', model: @category.class.model_name.human)
      redirect_to [:admin, @category]
    else      
      render :edit
    end
  end

  def destroy
    authorize @category
    @category.destroy
    flash[:success] = t('messages.deleted', model: @category.class.model_name.human)
    redirect_to admin_categories_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def category_params
      params.require(:category).permit(:name, :title, :abstract, :position, :visibility, :status, :url, :seo_title, :seo_description, :seo_keywords, :ancestry, :parent, :content, :cover_image, :remove_cover_image, images: [])
    end

    # Swaps positions of sibling categories if any selected in the _form
    def positions_swap
      if params[:sibling].present?
        sibling = Category.find_by id: params[:sibling]

        sibling_position          = sibling.position
        initial_category_ancestry = @category.ancestry

        # Swapping
        params[:category][:position], sibling_position = sibling_position, params[:category][:position]

        params[:category][:ancestry] = initial_category_ancestry    # Restore initial ancestry for Sibling
        sibling.update!(position: sibling_position)
      end
    end
    
    # Removes images, selected during Editing
    def remove_images
      @category.cover_image.purge if category_params[:remove_cover_image] == '1'
      image_to_remove_ids = params['image_to_remove_ids']
      if image_to_remove_ids.present?
        image_to_remove_ids.each do |image_to_remove_id|
          @category.images.find(image_to_remove_id).purge
        end
      end
    end
end
