class SwipesController < ApplicationController
  def new
    @movie = Uovie.find(params[:movie_id])
    @user = User.find(params[:user_id])
    @party = Party.find(params[:party_id])
    @swipe = Swipe.new
  end

  def create
    @swipe = Swipe.new(swipe_params)
    @swipe.movie = @movie
    @swipe.party = @party
    @swipe.user = current_user
  end
end
