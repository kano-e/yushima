# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['yushima', 'photo', Rails.env]

  # large * 2
  version :ll do
    process resize_to_fit: [1200, 1200]
  end

  # large
  version :l do
    process resize_to_fit: [960, 960]
  end

  version :m do
    process resize_to_fit: [480, 480]
  end

  # square medium
  version :sm do
    process resize_to_fill: [480, 480]
  end

  # square small
  version :ss do
    process resize_to_fill: [240, 240]
  end

  def public_id
    base = Rails.env.production? ? '' : "#{Rails.env}-"
    "#{base}#{model.class.name.underscore.gsub('_', '-')}-#{model.public_str}"
  end
end
