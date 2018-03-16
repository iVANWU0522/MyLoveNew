class Post < ApplicationRecord
  validates :caption, presence: true

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  def as_json(_opts = {})
    {
        id: id,
        caption: caption,
        errors: errors,
        photo_images: photos.map do |x|
          {
              url: x.image.url.absolute_url,
              name: x.image_file_name,
              id: x.id
          }
        end
    }
  end
end
