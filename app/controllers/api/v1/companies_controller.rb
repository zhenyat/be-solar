class Api::V1::CompaniesController < ApplicationController
  def show
    @company = Company.active.first
    # render json:  @company
    render json: ActiveStorage::Blob.service.send(:path_for, @company.cover_image.key)
  end
end
