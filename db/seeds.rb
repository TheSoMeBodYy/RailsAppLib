require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

100.times {|i|
  Library.create!([{ name: Faker::JapaneseMedia::CowboyBebop.quote }])
  Author.create!([{ name: Faker::Name.unique.name }])
  Genre.create!([{ name: Faker::Book.genre }])

  name0 = Faker::JapaneseMedia::CowboyBebop.episode
  sql0 = "INSERT INTO books VALUES ('#{i}','#{Author.last}', '#{Genre.last}', datetime('now','localtime'), datetime('now','localtime'), '#{name0}')"
  ActiveRecord::Base.connection.execute(sql0)

  name1 = Faker::JapaneseMedia::Naruto.name
  sql1 = "INSERT INTO users VALUES ('#{i}','#{name1}', '#{Faker::Internet.email}', datetime('now','localtime'), datetime('now','localtime'))"
  ActiveRecord::Base.connection.execute(sql1)

  sql2 = "INSERT INTO reader_cards VALUES ('#{i}','#{name1}', '#{name0}', datetime('now','localtime'), datetime('now','localtime'))"
  ActiveRecord::Base.connection.execute(sql2)
}

puts 'oui'