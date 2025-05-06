class Review < ApplicationRecord
  belongs_to :book

  has_rich_text :body

  validates :title, presence: true
end
