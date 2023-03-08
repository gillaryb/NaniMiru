class MoviesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @swipe = Swipe.new
    @party = Party.find(params[:party_id])
    @movies = Movie.joins(:movie_genres).where(movie_genres: {genre_id: @party.genres})
    render 'movies/index'
  end
end
