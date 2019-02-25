class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
    @songs = @artist.songs
  end

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to list_artist_path(@artist.list_id, @artist)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @song.destroy
    redirect_to artist_song_path(@song)
  end

  private
    def set_artist
      @artist = Artist.find(song_params[:artist_id])
    end

    def set_song
      @song = Song. find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name)
    end
end
