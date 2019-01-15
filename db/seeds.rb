require 'random_data'
#Create Users
15.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 'helloworld',
    password_confirmation: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

100.times do
  wiki = Wiki.new(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false
  )
  wiki.save!


end


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
