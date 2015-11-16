require_relative 'player'

class Game

  attr_reader :message1, :message2

  def initialize(player1 = Player.new, player2 = Player.new)
    @message1 = ''
    @message2 = ''
    $previous_result = :none
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
    if player1_winner?(player1, player2)
      @message1 = "You win" 
      @message2 = "Congratulations. Computer chose #{player2.choice}"
      $previous_result = :win
    end
    if player1_loser?(player1, player2)
      @message1 = "You lose" 
      @message2 = "Commiserations. Computer chose #{player2.choice}"
      $previous_result = :loss
    end
    if draw?(player1, player2)
      @message1 = "Draw" 
      @message2 = "Computer also chose #{player2.choice}"
      $previous_result = :draw
    end
  end

end

