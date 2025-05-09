class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews

  validates :title, presence: true
  validates :publication_date, presence: true

  before_validation :normalize_title

  private
  def normalize_title
    self.title = title.strip().titleize()
  end
end
