class AlbumsController < ApplicationController
  before_action :require_login

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    @recording_types = Album::RECORDING_TYPES
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    if @album.save
      render :show
    else
      render text: "Failure"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
