class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  version :thumbnail do
    eager
    resize_to_fit(250, 250)
    cloudinary_transformation :quality => 80
  end

  version :list_view do
    eager
    resize_to_fit(500, 500)
    cloudinary_transformation :quality => 80
  end
  
end
