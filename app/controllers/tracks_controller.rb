class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @all_albums = Album.all
    @track_types = Track::TRACK_TYPES
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    if @track.save
      render :show
    else
      render text: "Failure"
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
