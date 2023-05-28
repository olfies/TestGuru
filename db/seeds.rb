# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Category.create( title: "Music")
cat2 = Category.create( title: "Film")
cat3 = Category.create( title: "Series")

user1 = User.create(name: 'Gleb')
user2 = User.create(name: 'Andrey')
user3 = User.create(name: 'Masha')

test1 = Test.create(title: 'Rock', level: 1, category_id: cat1.id )
test2 = Test.create(title: 'Old films', level: 2, category_id: cat2.id )
test3 = Test.create(title: 'Long series', level: 3, category_id: cat3.id )


quest1 = Question.create( body: 'When did rock music appear in Russia?', test_id: test1.id )
quest2 = Question.create( body: 'When was the first movie made?', test_id: test2.id )
quest3 = Question.create( body: 'How many episodes are there in the longest TV series in the world?', test_id: test3.id )

answer1 = Answer.create( body: '1960', question_id: quest1.id, correct: true ),
answer1 = Answer.create( body: '1993', question_id: quest1.id, correct: false ),
answer2 = Answer.create( body: '1895', question_id: quest2.id, correct: true ),
answer2 = Answer.create( body: '1900', question_id: quest2.id, correct: false ),
answer3 = Answer.create( body: '18262', question_id: quest3.id, correct: true ),
answer3 = Answer.create( body: '18362', question_id: quest3.id, correct: false )
