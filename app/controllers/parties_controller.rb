class PartiesController < ApplicationController

  def index
    @parties = policy_scope(Party)
  end

  def new
    @party = Party.new
    authorize @party
  end

  def create
    @party = Party.new(party_params)
    authorize @party
    if @party.save
      Membership.create(user: current_user, party: @party)
      redirect_to party_path(@party)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @party = Party.find(params[:id])
    authorize @party
  end

  def swipe
    skip_authorization
  end

  private

  def party_params
    params.require(:party).permit(:name, :online)
  end

end
