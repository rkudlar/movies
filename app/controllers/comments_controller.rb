class CommentsController < ApplicationController
  before_action -> { authorization(comment) }, only: %i[edit update destroy]

  def edit
    render_form
  end

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, movie_id: params[:movie_id]))
    if @comment.save
      update_comments(@comment.movie)
    else
      @movie = @comment.movie
      @comments = @movie.comments
      render 'movies/show'
    end
  end

  def update
    if comment.update(comment_params)
      update_comments(comment.movie)
    else
      render_form
    end
  end

  def destroy
    comment.destroy!
    update_comments(comment.movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def update_comments(movie)
    @movie = movie
    @comment = Comment.new
    @comments = Comment.where(movie:).order(:id)
    render turbo_stream: turbo_stream.replace('comments', partial: 'comments/comments')
  end

  def render_form
    @movie = comment.movie
    render turbo_stream: turbo_stream.replace("comment_#{params[:id]}",
                                              partial: 'comments/form',
                                              locale: {url: movie_comment_path})
  end
end
