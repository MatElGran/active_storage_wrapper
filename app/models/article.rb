class Article < ApplicationRecord
  include Imageable

  has_images :schemas do |attachable|
    attachable.variant :thumb, resize_to_limit: [500, 500]
  end
end
