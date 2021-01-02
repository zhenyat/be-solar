class Admin::CompaniesController < Admin::BaseController
  before_action :set_company, only: [:show, :edit, :update,:destroy]

  def index
    @companies = policy_scope(Company)
  end

  def show
    authorize @company
  end

  def new
    @company = Company.new
    authorize @company
  end

  def edit
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      flash[:success] = t('messages.created', model: @company.class.model_name.human)
      redirect_to [:admin, @company]
    else      
      render :new
    end
  end

  def update
    authorize @company
    if @company.update(company_params)
      flash[:success] = t('messages.updated', model: @company.class.model_name.human)
      redirect_to [:admin, @company]
    else      
      render :edit
    end
  end

  def destroy
    authorize @company
    @company.destroy
    flash[:success] = t('messages.deleted', model: @company.class.model_name.human)
    redirect_to admin_companies_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def company_params
      params.require(:company).permit(:name, :title, :email, :phone, :address, :url, :position, :status, :seo_title, :seo_description, :seo_keywords, :content, :cover_image, :remove_cover_image, images: [])
    end
end
