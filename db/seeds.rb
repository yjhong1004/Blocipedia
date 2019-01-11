require 'random_data'
#Create Users
15.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

 # Create Wikis
 50.times do

   Wiki.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private: false
   )
 end
 wikis = Wiki.all


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
