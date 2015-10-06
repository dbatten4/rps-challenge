require_relative 'player'

class Game

  def initialize(player1 = Player.new, player2 = Player.new)
    @human = player1
    @computer = player2
  end

  def player1_winner?(player1, player2)
    return true if player1.choice == :rock && player2.choice == :scissors
    return true if player1.choice == :paper && player2.choice == :rock
    return true if player1.choice == :scissors && player2.choice == :paper
  end

  def player1_loser?(player1, player2)
    return true if player1.choice == :rock && player2.choice == :paper
    return true if player1.choice == :paper && player2.choice == :scissors
    return true if player1.choice == :scissors && player2.choice == :rock
  end

  def draw?(player1, player2)
    return true if player1.choice == player2.choice
  end

  def play_game(player1, player2)
    @computer.generate_turn
    if game.player1_winner?(human, computer)
      @message1 = "You win" 
      @message2 = "Congratulations. Computer chose #{computer.choice}"
      $previous_result = :win
    end
    if game.player1_loser?(human, computer)
      @message1 = "You lose" 
      @message2 = "Commiserations. Computer chose #{computer.choice}"
      $previous_result = :loss
    end
    if game.draw?(human, computer)
      @message1 = "Draw" 
      @message2 = "Computer also chose #{computer.choice}"
      $previous_result = :draw
    end
  end

end

