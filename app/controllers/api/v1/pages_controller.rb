class Api::V1::PagesController < Api::ApiController
  def contacts
    company = Company.active.first
    cover_image_url = cover_image_url(company)

    render json:  {company: company, cover_image_url: cover_image_url}
  end
end