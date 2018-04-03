class User < ApplicationRecord
  # Validation
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 16 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
