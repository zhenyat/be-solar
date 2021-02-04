class Api::V1::SamplesController < Api::ApiController
  include ImagesUrl

  def index
    samples = Sample.active
    samples.each {|s| s.cover_image_url = cover_image_url(s)}

    render json: samples
  end
end