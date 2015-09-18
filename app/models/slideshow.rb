class Slideshow < ActiveRecord::Base
  mount_uploader :picture, SlideshowUploader
end
