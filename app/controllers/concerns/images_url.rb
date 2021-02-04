################################################################################
# Defines images URL of an Object
#
# 04.02.2021  ZT
################################################################################
module ImagesUrl
  extend ActiveSupport::Concern

  private

  def cover_image_url(object)
    api_host =  Rails.application.config.default_url_options[:api_host]

    if object.cover_image.attached?
      cover_image_path = Rails.application.routes.url_helpers.rails_blob_path(
        object.cover_image, 
        disposition: "attachment", 
        only_path: true
      )
      return api_host + cover_image_path
    else
      return ''
    end
  end
end