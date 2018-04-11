class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :caption, presence: true

  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true
end
