class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :user_id, presence: true
  validates :caption, length: { in: 3..300 }


end
