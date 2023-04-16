class MoviesController < ApplicationController
  before_action :check_authorization, only: %i[edit update destroy]

  def index
    @movies = Movie.all
  end

  def show
    movie
  end

  def new
    @movie = Movie.new
  end

  def edit
    movie
  end

  def create
    @movie = Movie.new(movie_params.merge(user_id: current_user.id))
    @movie.attach_omdb_image(params[:image_url]) if movie_params[:image].blank? && params[:image_url].present?
    if @movie.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if movie.update(movie_params)
      movie.attach_omdb_image(params[:image_url]) if movie_params[:image].blank? && params[:image_url].present?
      redirect_to movie_path(movie)
    else
      render :edit, status: :forbidden
    end
  end

  def destroy
    movie.destroy!
    redirect_to root_path
  end

  def fill_with_omdb
    @movie = OmdbService.call(params[:title], params[:year], params[:movie_id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :runtime, :released, :genre, :actors, :director,
                                  :imdb_rating, :image)
  end

  def movie
    @movie ||= Movie.find(params[:id])
  end

  def check_authorization
    return if current_user == movie.user

    redirect_to root_url
  end
end
