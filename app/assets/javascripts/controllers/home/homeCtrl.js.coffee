HomeIndexCtrl = ($scope, $http) ->
  $scope.title = "Tic Tac Toe With Bot"
  $scope.grid = this.initGameService()
  initGameService ->
   @gameServicehelper = new GameServicehelper
  
  newGame = ->
   initGameService()
   @gameServicehelper.freeCellsRemaining = 9
   @played = false
   @gameServicehelper.turn = 0

  saveGame = ->
    $http.post('./tic_tac_api/api/save', data).success(  ->
      'save'
    ).error( ->
      alert('Failed to save game.')
    )


  playerClick(cell) ->
    if( @gameServicehelper.cells[cell].is_free == false || this.played )
      return
    if(@gameServicehelper.turn == 0)
      @gameServicehelper.cells[cell].setValue('not')
    else
      @gameServicehelper.setValue('cross')
    this.changeTurn()
  
  botTurn ->
    alert('Bots Turn')
    
    if( @gameServicehelper.freeCellsRemaining <= 0)
      return
    bot_move = ->
      $http.get('./tic_tac_api/v1/play.json').success((data) ->
        this.playerClick(data)
        ).error( ->
          console.error('API call failed')
          alert('Opps and error occured looks like the Bot is stuck thinking..')
          )
    
    

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

class GridCell
  @is_free: true
  @value: ''
  @symbol: ''

  GridCell::setValue = (value) ->
    @value = value
    if @value == 'not'
      @symbol = 'not'
    else
      @symbol = 'close'
    return

class GameServicehelper
    @players = []
    @turn = 0
    @draw = 0
    @cells = []
    @freeCellsRemaining = 9
    constructor ->
      initcells()
      initPlayers()

  GameServicehelper::initCells = ->
    @cells = []
    i = 1
    while i <= 9
      cell = new GridCell
      cell.free = true
      cell.value = ''
      cell.symbol = ''
      @cells.push cell
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


