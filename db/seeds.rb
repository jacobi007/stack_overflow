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
Category.delete_all

categories = %w{ Ruby Ruby\ on\ Rails Javascript Java Android C++ Obj-C
                 C# Python Django Javascript\ Frameworks Scala CoffeeScript
                 HTML\ &\ CSS Web\ Design UX\ Design None\ of\ above
               }

100.times do |n|
  User.create(username: Faker::Internet.user_name,
              email: "jacobi#{n+1}@example.com",
              avatar: "http://www.lorempixel.com/170/170/abstract/#{n%10}",
              password: "jacobi",
              password: "jacobi",
              points: (rand(1000) + 25))
end

categories.each do |category|
  Category.create(name: category)
end

User.first(20).each do |user|
  3.times do
    offset = rand(Category.count)
    user.questions.create(title: Faker::Lorem.sentence,
                          body: Faker::Lorem.paragraph(rand(20)+5),
                          category: Category.first(offset: offset))
  end
end

Question.all.each do |question|
  (rand(5)).times do
  question.answers.create(body: Faker::Lorem.paragraph(rand(4)+1),
                          user_id: (rand(100)+1))
  end
end

Category.all.each do |c|
  c.update_attribute :questions_count, c.questions.count
end

Question.all.each do |q|
  q.update_attribute :answers_count, c.answers.count
end
