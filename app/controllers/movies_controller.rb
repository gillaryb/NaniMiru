class MoviesController < ApplicationController
  def index
    @movies = policy_scope(Movie)
  end
end
