namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User009", username:"musty7000", email: "example009@railstutorial.org", password: "foobar", password_confirmation: "foobar")
    admin.toggle!(:admin)    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name, email: email, username: username, password: password, password_confirmation: password)
    end
  end
end
