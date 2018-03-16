class Photo < ApplicationRecord
  belongs_to :post, inverse_of: :photos
end
