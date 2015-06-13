class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit    
  end

  def create
    @song = Song.new(song_params)
    
    respond_to do |format|
      if @song.save
                
        create_join params unless params[:intensity_id].nil? || params[:mood_id].nil?
        
        format.html { redirect_to songs_path, notice: 'Song was successfully created' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
                        
        create_join params unless params[:intensity_id].nil? || params[:mood_id].nil?
        
        format.html { redirect_to songs_path, notice: 'Song was successfully updated' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_path, notice: 'Song was successfully destroyed' }
      format.json { head :no_content }
    end
  end
  
  private
  def set_song
    @song = Song.find(params[:id])
  end
  
  def song_params
    params.require(:song).permit(:name, :copyright, :artist, :audio_url, :image_url)
  end
  
  def create_join(params)    
    IntensitiesMoodsSong.destroy_all(song: @song.id)
    
    join_args = {}
    
    join_args [:intensity] = Intensity.find(params[:intensity_id])    
    join_args [:mood] = Mood.find(params[:mood_id])
    join_args [:song] = @song
    
    IntensitiesMoodsSong.create(join_args)
  end
end
