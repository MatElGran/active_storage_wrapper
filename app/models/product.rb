class Product < ApplicationRecord
  include Imageable

  has_images :photos do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [300, 300]
  end
end
