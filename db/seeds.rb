# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Let's seed the Word table in our DB
f = File.open("words", "r")
f.each_line do |line|
  Word.create!(word:line.to_s.gsub(/\n/, ""))
  puts line.to_s.gsub(/\n/, "")
end
f.close
