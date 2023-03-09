class PartiesController < ApplicationController
  def index
    @parties = policy_scope(Party)
  end

  def new
    @party = Party.new
    @party.party_genres.build
    authorize @party
    @genres = Genre.all.order(name: :asc)
  end

  def create
    @party = Party.new(party_params)
    authorize @party
    if @party.save
      Membership.create(user: current_user, party: @party)

      redirect_to party_path(@party)
    else

      @genres = Genre.all.order(name: :asc)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @party = Party.find(params[:id])
    authorize @party

    if @party.has_match?
      @movie = @party.accepted_movies.first
      render "swipes/show"
    end
  end

  def swipe
    skip_authorization
  end

  private

  def party_params
    params.require(:party).permit(:name, :online, party_genres_attributes: [:genre_id])
  end
end
