
# Categories

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



cat1 = Category.create(title: "Музыка")
cat2 = Category.create(title: "Фильм")
cat3 = Category.create(title: "Сериал")

# Users
user1 = User.create(
  name: 'Глеб',
  email: 'dota2@mail.ru',
  password: 'qwe123'
)

user2 = User.create(
  name: 'Андрей',
  email: 'csgo2@gmail.ru',
  password: 'zxcqwe'
)

user3 = User.create(
  name: 'Маша',
  email: 'worldoftanks@yandex.ru',
  password: 'zxc123'
)

# Tests
test1 = Test.create(
  title: 'Рок',
  level: 1,
  author_id: user1.id,
  category_id: cat1.id
)

test2 = Test.create(
  title: 'Старые фильмы',
  level: 2,
  author_id: user2.id,
  category_id: cat2.id
)

test3 = Test.create(
  title: 'Длинные сериалы',
  level: 3,
  author_id: user3.id,
  category_id: cat3.id
)

# Questions
quest1 = Question.create(body: 'Когда появилась рок-музыка в России?', test_id: test1.id)
quest2 = Question.create(body: 'Когда был снят первый фильм?', test_id: test2.id)
quest3 = Question.create(body: 'Сколько эпизодов в самом длинном телесериале в мире?', test_id: test3.id)

# Answers
answer1 = Answer.create(body: '1960', question_id: quest1.id, correct: true)
answer2 = Answer.create(body: '1993', question_id: quest1.id, correct: false)
answer3 = Answer.create(body: '1895', question_id: quest2.id, correct: true)
answer4 = Answer.create(body: '1900', question_id: quest2.id, correct: false)
answer5 = Answer.create(body: '18262', question_id: quest3.id, correct: true)
answer6 = Answer.create(body: '18362', question_id: quest3.id, correct: false)

# Test passages

cat1 = Category.create( title: "Music")
cat2 = Category.create( title: "Film")
cat3 = Category.create( title: "Series")
cat1 = Category.create( title: "Музыка")
cat2 = Category.create( title: "Фильм")
cat3 = Category.create( title: "Сериал")

user1 = User.create(name: 'Gleb')
user2 = User.create(name: 'Andrey')
user3 = User.create(name: 'Masha')
user1 = User.create(name: 'Глеб')
user2 = User.create(name: 'Андрей')
user3 = User.create(name: 'Маша')

test1 = Test.create(title: 'Rock', level: 1, author_id: user1.id, category_id: cat1.id )
test2 = Test.create(title: 'Old films', level: 2, author_id: user2.id, category_id: cat2.id )
test3 = Test.create(title: 'Long series', level: 3, author_id: user3.id, category_id: cat3.id )
test1 = Test.create(title: 'Рок', level: 1, author_id: user1.id, category_id: cat1.id )
test2 = Test.create(title: 'Старые фильмы', level: 2, author_id: user2.id, category_id: cat2.id )
test3 = Test.create(title: 'Длинные сериалы', level: 3, author_id: user3.id, category_id: cat3.id )

quest1 = Question.create( body: 'When did rock music appear in Russia?', test_id: test1.id )
quest2 = Question.create( body: 'When was the first movie made?', test_id: test2.id )
quest3 = Question.create( body: 'How many episodes are there in the longest TV series in the world?', test_id: test3.id )
quest1 = Question.create( body: 'Когда появилась рок-музыка в России?', test_id: test1.id )
quest2 = Question.create( body: 'Когда был снят первый фильм?', test_id: test2.id )
quest3 = Question.create( body: 'Сколько эпизодов в самом длинном телесериале в мире?', test_id: test3.id )

answer1 = Answer.create( body: '1960', question_id: quest1.id, correct: true ),
answer1 = Answer.create( body: '1993', question_id: quest1.id, correct: false ),
answer2 = Answer.create( body: '1895', question_id: quest2.id, correct: true ),
answer2 = Answer.create( body: '1900', question_id: quest2.id, correct: false ),
answer3 = Answer.create( body: '18262', question_id: quest3.id, correct: true ),
answer3 = Answer.create( body: '18362', question_id: quest3.id, correct: false )


test_passage1 = TestPassage.create(user_id: user1.id, test_id: test1.id, current_question_id: quest1.id)
test_passage2 = TestPassage.create(user_id: user2.id, test_id: test2.id, current_question_id: quest2.id)
test_passage3 = TestPassage.create(user_id: user3.id, test_id: test3.id, current_question_id: quest3.id)
