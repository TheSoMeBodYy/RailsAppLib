class Library < ApplicationRecord
  has_many :books
  has_many :reader_cards
end
