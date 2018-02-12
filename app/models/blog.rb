class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 50 }
end
