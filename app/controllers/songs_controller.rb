class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(title: params[:title], artist_name: params[:artist_name], release_year: params[:release_year].to_i, released: params[:released], genre: params[:genre])
    if @song.valid?
      @song.save
      redirect_to song_path(@song.id)
    else
      render :new
    end
  end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    new_song = Song.new(title: params[:title], artist_name: params[:artist_name], release_year: params[:release_year].to_i, released: params[:released], genre: params[:genre])
    if new_song.valid?
      @song.update(title: params[:title], artist_name: params[:artist_name], release_year: params[:release_year].to_i, released: params[:released], genre: params[:genre])
      @song.save
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end
  
  
  
  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
  
  
      
end
  
  
end
