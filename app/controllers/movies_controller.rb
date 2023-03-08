class MoviesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @swipe = Swipe.new
    @party = Party.find(params[:party_id])
    if @party.genres.present?
      @movies = Movie.joins(:movie_genres).where(movie_genres: {genre_id: @party.genres})
      render 'movies/index'
    else
      @genres = Genre.all.order(name: :asc)
      render 'genres/index' # this is a view
    end
  end
end
