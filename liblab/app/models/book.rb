class Book < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :authors
  has_many :reader_cards
end
