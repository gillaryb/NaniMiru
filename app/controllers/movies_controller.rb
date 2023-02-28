class MoviesController < ApplicationController
  def index
    @movies = policy_scope(Movie)
    @swipe = Swipe.new
    @party = Party.find(params[:party_id])
  end
end
