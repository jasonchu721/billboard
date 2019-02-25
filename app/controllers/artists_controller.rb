class ArtistsController < ApplicationController
  before_action :set_list
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
    
  def index
    @artists = @list.artists
  end

  def show
  end

  def new
    @artist = @list.artists.new
  end

  def edit 
  end

  def create
    @artist = @list.artists.new(artist_params)

    if @artist.save
      redirect_to [@list, @artist]
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to [@list, @artist]
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to list_artists_path
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :avatar)
    end
  end 
