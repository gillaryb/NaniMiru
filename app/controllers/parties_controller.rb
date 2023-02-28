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
    if @party.save
      Membership.create(user: current_user, party: @party)
      redirect_to party_path(@party)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def party_params
    params.require(:party).permit(:name, :online)
  end


end
