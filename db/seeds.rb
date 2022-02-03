require "faker"

puts "Seeding users and tweets..."

Tweet.delete_all
User.delete_all

admin = User.create(email: "admin@mail.com",
                    username: "admin",
                    name:"Admin the Great",
                    password: "letmein",
                    role: 1)

team = [["ximecalderon", "Ximena Calderón"],
        ["sakuta", "Luis Chota"],
        ["pedro_art", "Pedro Aruata"],
        ["cowalsky", "Antony Rojas"]]

team.each do |username, name|
  user = User.new(email: "#{name.split.first.downcase}@mail.com",
                  username: username,
                  name:name,
                  password: "letmein",
                  role: 0)
  user.avatar.attach(io: URI.open(Faker::Avatar.unique.image(size: "100x100", format: "jpg")), filename: "#{username}.jpg")
  p user.errors.full_messages unless user.save

  tweet = Tweet.create(body: Faker::Quote.unique.famous_last_words, user_id: user.id)
end

puts "Seeding of #{User.all.size} users and #{Tweet.all.size} tweets completed."

puts "Seeding replies..."
Tweet.all.each do |tweet|
  users = User.all.to_a
  users.delete(tweet.user)

  users.each do |user|
    reply = Tweet.create(body: Faker::Quote.unique.famous_last_words, user_id: user.id)
    tweet.replies.push(reply)
  end
end

puts "Seeding of replies completed."

puts "Seeding likes..."
puts "Seeding likes completed."
