class TicTacApi::V1::GameServiceController < ApplicationController
  respond_to :json
  before_action :set_game, only: [:show, :start_game, :score, :save, :pause]

  # post request
  def register_player
    
  end

  def show
    game = @game
    respond_with(game) do |format|
      format.json{ render :json => game.as_json }
    end
  end

  def start_game
    start_game = @game
    respond_with(start_game) do |format|
      format.json{ render :json => start_game.as_json }
    end
  end

  def index
    load_games_history = Game.all
    respond_with(load_games_history) do |format|
      format.json{ render :json => load_games_history.as_json }
    end
  end

  #post request to create a new game session
  def new_game
    @game = Game.new
  end

  #get sscore
  def score
  end

  def edit
  end

  def save
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'The game was successfully saved.' }
        format.json { render :index, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def pause
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'The game  was successfully paused.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
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
