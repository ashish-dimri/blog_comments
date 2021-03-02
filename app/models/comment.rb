class Comment < ApplicationRecord
	# Associations
	has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :comments

  # Vaidations
  validates :body, presence: true
end
