class OmdbService < ApplicationService
  def initialize(title, year, movie_id)
    super
    @url = URI("#{Settings.omdb.url}?apikey=#{Settings.omdb.api_key}&t=#{title}&y=#{year}")
    @movie = movie_id ? Movie.find(movie_id) : Movie.new
  end

  def call
    response = Net::HTTP.get(@url)
    json = JSON.parse(response)

    return if json['Response'] == 'False'

    @movie.attributes = movie_mapper(json)
    @movie
  end

  private

  def movie_mapper(params)
    {
      title: params['Title'],
      description: params['Plot'],
      runtime: params['Runtime'].to_i,
      released: params['Released'],
      genre: params['Genre'],
      actors: params['Actors'],
      director: params['Director'],
      imdb_rating: params['imdbRating'],
      image_url: params['Poster'] != 'N/A' ? params['Poster'] : nil
    }
  end
end
