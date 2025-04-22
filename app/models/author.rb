class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :normalize_name

  private
  def normalize_name
    self.first_name = first_name.strip().titleize()
    self.last_name = last_name.strip.titleize
  end
end
