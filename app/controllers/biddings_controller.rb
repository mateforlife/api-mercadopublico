class BiddingsController < ApplicationController
  before_action :set_bidding, only: [:show, :edit, :update, :destroy]

  def index
    @biddings = Bidding.all
  end

  def create
    @bidding = Bidding.new(bidding_params)
    respond_to do |format|
      if @bidding.save
        format.html { redirect_to biddings_path, notice: 'Licitacion ha sido guardada.' }
        format.json { render :index, status: :created, location: @bidding }
      else
        format.html { render :new }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_bidding
    @bidding = Bidding.find(params[:id])
  end

  def bidding_params
    params.require(:bidding).permit(:external_code, :name, :deadline, :state)
  end
end
