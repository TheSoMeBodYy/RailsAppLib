json.extract! book, :id, :authors, :genres, :created_at, :updated_at
json.url book_url(book, format: :json)
