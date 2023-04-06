class RemoveBooksQFromLibraries < ActiveRecord::Migration[7.0]
  def change
    remove_column :libraries, :books_q, :string
  end
end
