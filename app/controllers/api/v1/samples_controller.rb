class Api::V1::SamplesController < Api::ApiController
  include ImagesUrl

  def index
    samples = Sample.active
    samples.each {|s| s.cover_image_url = cover_image_url(s)}

    render json: samples
  end

  def show
    sample = Sample.find(params[:id])
    sample.cover_image_url = cover_image_url(sample)

    # puts "#{params}"
    render json: sample
  end

end