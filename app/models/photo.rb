class Photo < ApplicationRecord
  belongs_to :post, inverse_of: :photos

  has_attached_file :image, styles: { :thumb => "x100", :medium => "640x", :big => "1000x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
