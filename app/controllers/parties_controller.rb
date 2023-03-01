class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
    # @pages = Page.new
    # @review = Review.new
    # authorize @party
  end
end
