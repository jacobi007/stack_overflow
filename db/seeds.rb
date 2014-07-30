# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Question.delete_all
Answer.delete_all

100.times do |n|
  User.create(username: Faker::Internet.user_name,
              email: "jacobi#{n+1}@example.com",
              avatar: "http://www.lorempixel.com/80/80/abstract/#{n%10}",
              password: "jacobi",
              password: "jacobi")
end

User.first(20).each do |user|
  user.questions.create(title: Faker::Lorem.sentence,
                        body: Faker::Lorem.paragraph(rand(20)+5),
                        category: Faker::Lorem.word)
end

Question.all.each do |question|
  (rand(5)+1).times do
  question.answers.create(body: Faker::Lorem.paragraph(rand(4)+1),
                          user_id: (rand(100)+1))
  end
end
