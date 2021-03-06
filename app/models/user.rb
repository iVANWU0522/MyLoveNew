class User < ApplicationRecord
  # Validation
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 16 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
