# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Category.create(name: "Music")
cat2 = Category.create(name: "Film")
cat3 = Category.create(name: "Series")

user1 = User.create(first_name: 'Gleb')
user2 = User.create(first_name: 'Andrey')
user3 = User.create(frist_name: 'Masha')

quest1 = Question.create( body: 'When did rock music appear in Russia?', test_id: test1.ıd )
quest2 = Question.create( body: 'When was the first movie made?', test_id: test2.ıd )
quest3 = Question.create( body: 'How many episodes are there in the longest TV series in the world?', test_id: test3.ıd )

test1 = Test.create(title: 'Rock', level: 1, category_ıd: cat1.ıd )
test2 = Test.create(title: 'Old films', level: 2, category_ıd: cat2.ıd )
test3 = Test.create(title: 'Long series', level: 3, category_ıd: cat3.ıd )


Answer.create!([
    { body: '1960', question_id: 1, correct: true },
    { body: '1993', question_id: 1, correct:false },
    { body: '1895', question_id: 2, correct: true },
    { body: '1900', question_id: 2, correct: false },
    { body: '18262', question_id: 3, correct: false },
    { body: '18362', question_id: 3, correct: true }
  ])
