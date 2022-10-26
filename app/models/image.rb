class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :file
  delegate :persisted?, to: :imageable, allow_nil: true

  delegate_missing_to :file

  # The name attribute value is the name of the relation we create on Image
  # when calling Imageable.has_images. We call the attr_reader created by
  # the relation definition, or fallback to a generic attachment if no name
  # exists (eg on Image.new)
  def file
    name ? public_send(name) : ActiveStorage::Attached::One.new('file', self)
  end

  def file=(attrs)
    file.attach attrs unless attrs.blank?
  end
end
