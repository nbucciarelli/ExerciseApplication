# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: "test@example.com", password: "password", password_confirmation: "password"})

['Abs', 'Shoulders', 'Back', 'Biceps', 'Chest'].each do |muscle|
  Muscle.create({name: muscle})
end

10.times do 
  difficulty = case Random.rand(3)
  when 0
    "Easy"
  when 1
    "Medium"
  when 2
    "Hard"
  end
  Exercise.create({name: Faker::Lorem.words(3).join(" "), difficulty: difficulty, exercise_type: "Some shit"})
end