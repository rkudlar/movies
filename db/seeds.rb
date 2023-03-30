if Rails.env.development?
  5.times do
    movie = Movie.new(title: Faker::Movie.title, description: Faker::Lorem.paragraph)
    movie.images.attach(io: File.open(Rails.root.join('tmp/image2.jpg')), filename: 'image2.jpg')
    movie.save!
  end
end
