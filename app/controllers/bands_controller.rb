class BandsController < ApplicationController
  before_action :require_login

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    if @band.save
      render :show
    else
      render text: "Failure"
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def new; end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
