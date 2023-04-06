require 'faker'

Library.delete_all
Author.delete_all
Genre.delete_all
Book.delete_all
User.delete_all
ReaderCard.delete_all

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
