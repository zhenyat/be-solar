class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update,:destroy]

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
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      flash[:success] = t('messages.created', model: @category.class.model_name.human)
      redirect_to [:admin, @category]
    else      
      render :new
    end
  end

  def update
    authorize @category
    if @category.update(category_params)
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
      params.require(:category).permit(:name, :title, :abstract, :position, :status, :url, :seo_title, :seo_description, :seo_keywords, :ancestry, :content, :cover_image, :remove_cover_image, images: [])
    end
end
