class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :blogs, inverse_of: :user
  has_many :comments, inverse_of: :user

  # Validations
  validates :name, presence: true
end
