HomeIndexCtrl = ($scope) ->
  $scope.title = "Tic Tac Toe with Bot"
  $scope.grid = this.initGameService()
  initGameService ->
   @gameServicehelper = new GameServicehelper
  
  playerClick(i) ->
    if(@gameServicehelper.turn == 0)
      @gameServicehelper.blocks[i].setValue('not')
    else
      @gameServicehelper.setValue('cross')
    this.changeTurn()
  
  botTurn ->
    alert('Bots Turn')
  
  changeTurn ->
    @gameServicehelper.changeTurn()
    if(@gameServicehelper.turn == 1)
      this.botTurn()

@tttWebApp.controller('HomeIndexCtrl', HomeIndexCtrl)


class Player
  @is_bot: true
  @score: 0

  Player::updateScore = (total) ->
    @score += total
    @score

class GridBlock
  @is_free: true
  @value: ''
  @symbol: ''

  GridBlock::setValue = (value) ->
    @value = value
    if @value == 'not'
      @symbol = 'panorama_fish_eye'
    else
      @symbol = 'close'
    return

class GameServicehelper
    @players = []
    @turn = 0
    @draw = 0
    @blocks = []
    @freeBlocksRemaining = 9
    constructor ->
      initBlocks()
      initPlayers()

  GameServicehelper::initBlocks = ->
    @blocks = []
    i = 1
    while i <= 9
      block = new GridBlock
      block.free = true
      block.value = ''
      block.symbol = ''
      @blocks.push block
      ++i
    return

  GameServicehelper::initPlayers = ->
    # Player1
    player1 = new Player
    player1.bot = false
    # Bot
    player2 = new Player
    @players.push player1
    @players.push player2
    return

  GameServicehelper::changeTurn = ->
    if @turn == 1
      @turn = 0
    else
      @turn = 1
    @turn


