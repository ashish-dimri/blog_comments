class Blog < ApplicationRecord
	# Associations
	belongs_to :user, inverse_of: :blogs
	has_many :comments, as: :commentable

  # Vaidations
  validates :title, :body, presence: true
end
