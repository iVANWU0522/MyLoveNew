class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
end
