class SlideshowUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [242, 70]
  end

  version :slide do
    process resize_to_fit: [1600, 450]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
