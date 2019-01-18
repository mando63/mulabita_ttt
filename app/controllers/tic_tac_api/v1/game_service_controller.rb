class GameServiceController < ApplicationController

  before_action :set_game, :only [:show, :start_game, :score, :save, :pause]
  # post request
  def register_player
    
  end

  def show
    render json: @game
  end

  def start_game
    render json: @game
  end

  def index
    render json: Game.all
  end

  #post request to create a new game session
  def new_game
    @game = Game.new
  end

  end
  #get sscore
  def score
  end

  def edit
  end

  def save 
    respond_to do |format|
    if @game.update(game_params)
      format.html { redirect_to @vehicle, notice: 'The game was successfully saved.' }
      format.json { render :index, status: :200, location: @game }
    else
      format.html { render :edit }
      format.json { render json: @game.errors, status: :400 }
    end
  end

  end


  def pause
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'The game  was successfully paused.' }
        format.json { render :show, status: :200, location: @game }
      els
        format.html { render :edit }
        format.json { render json: @game.errors, status: :400 }
      end
    end
  end

  # get /player/
  def history_results
  end

    private

  def player_params
    params.require(:player).permit(:player_name, :player_email, :player_alias)
  end

  def game_params
    params.require(:game).permit(:game_desc,:state)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
