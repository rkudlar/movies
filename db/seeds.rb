if Rails.env.development?
  user = User.create!(username: 'username', password: 'password', email: 'user@examle.com')
  5.times do
    movie = Movie.new(title: Faker::Movie.title, description: Faker::Lorem.paragraph, user:)
    movie.image.attach(io: File.open(Rails.root.join('tmp/image2.jpg')), filename: 'image2.jpg')
    movie.save!
  end
end
