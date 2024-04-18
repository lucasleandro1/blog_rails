class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  validates :text, presence: true
end
