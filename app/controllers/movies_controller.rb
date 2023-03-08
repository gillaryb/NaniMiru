class MoviesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @swipe = Swipe.new
    @party = Party.find(params[:party_id])
    if params[:genre_ids].present?
      @movies = Movie.joins(:movie_genres).where(movie_genres: {genre_id: params[:genre_ids]})
      render 'movies/index'
    else
      @genres = Genre.all.order(name: :asc)
      render 'genres/index' # this is a view
    end
    # @movies = policy_scope(Movie)
    # @swipe = Swipe.new
    # @party = Party.find(params[:party_id])
  end
end
