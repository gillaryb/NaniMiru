class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
    @user = current_user
  end
end
