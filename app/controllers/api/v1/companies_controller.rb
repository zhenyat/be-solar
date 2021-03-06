class Api::V1::CompaniesController < ApplicationController
  include ImagesUrl

  def show
    company = Company.active.first
    cover_image_url = cover_image_url(company)

    render json:  {company: company, cover_image_url: cover_image_url}
  end
end
