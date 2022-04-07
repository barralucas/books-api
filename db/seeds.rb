100.times do
    title = Faker::Book.title,
    author = Faker::Book.author,

    Book.create(title: title, author: author)
end