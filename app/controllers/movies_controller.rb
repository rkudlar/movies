class MoviesController < ApplicationController
  before_action -> { authorization(movie) }, only: %i[edit update destroy]

  def index
    @movies = Movie.all
  end

  def show
    movie
    @comments = movie.comments.order(:id)
    @comment = Comment.new
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
      flash[:success] = 'Movie added !'
      redirect_to root_path
    else
      flash[:danger] = 'Failed to add movie !'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if movie.update(movie_params)
      movie.attach_omdb_image(params[:image_url]) if movie_params[:image].blank? && params[:image_url].present?
      flash[:success] = 'Movie updated !'
      redirect_to movie_path(movie)
    else
      flash[:danger] = 'Failed to update movie !'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    movie.destroy!
    flash[:success] = 'Movie successfully deleted'
    redirect_to root_path
  end

  def fill_with_omdb
    @movie = OmdbService.call(params[:title], params[:year], params[:movie_id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  def search
    @movies = Movie.where(Movie.arel_table[:title].matches("%#{params[:search]}%")
                               .or(Movie.arel_table[:description].matches("%#{params[:search]}%")))
    render :index, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :runtime, :released, :genre, :actors, :director,
                                  :imdb_rating, :image)
  end

  def movie
    @movie ||= Movie.find(params[:id])
  end
end
