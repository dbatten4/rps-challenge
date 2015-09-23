require 'game'

describe Game do 

  context 'player1 wins' do 

    it 'player1 wins if player1 chooses rock and player2 chooses scissors' do
      player1 = (double :player, choice: :rock)
      player2 = (double :player, choice: :scissors)
      expect(subject.player1_winner?(player1, player2)).to eq(true)
    end

    it 'player1 wins if player1 chooses paper and player2 chooses rock' do
      player1 = (double :player, choice: :paper)
      player2 = (double :player, choice: :rock)
      expect(subject.player1_winner?(player1, player2)).to eq(true)
    end

    it 'player1 wins if player1 chooses scissors and player2 chooses paper' do
      player1 = (double :player, choice: :scissors)
      player2 = (double :player, choice: :paper)
      expect(subject.player1_winner?(player1, player2)).to eq(true)
    end

  end

  context 'player1 loses' do

    it 'player1 loses if player1 chooses rock and player2 chooses paper' do 
      player1 = (double :player, choice: :rock)
      player2 = (double :player, choice: :paper)
      expect(subject.player1_loser?(player1, player2)).to eq(true)
    end

    it 'player1 loses if player1 chooses scissors and player2 chooses rock' do 
      player1 = (double :player, choice: :scissors)
      player2 = (double :player, choice: :rock)
      expect(subject.player1_loser?(player1, player2)).to eq(true)
    end

    it 'player1 loses if player1 chooses paper and player2 chooses scissors' do 
      player1 = (double :player, choice: :paper)
      player2 = (double :player, choice: :scissors)
      expect(subject.player1_loser?(player1, player2)).to eq(true)
    end

  end

  context 'draw' do 

    it 'is a draw if player1 and player2 choose rock' do 
      player1 = (double :player, choice: :rock)
      player2 = (double :player, choice: :rock)
      expect(subject.draw?(player1, player2)).to eq(true)
    end

    it 'is a draw if player1 and player2 choose paper' do 
      player1 = (double :player, choice: :paper)
      player2 = (double :player, choice: :paper)
      expect(subject.draw?(player1, player2)).to eq(true)
    end

    it 'is a draw if player1 and player2 choose scissors' do 
      player1 = (double :player, choice: :scissors)
      player2 = (double :player, choice: :scissors)
      expect(subject.draw?(player1, player2)).to eq(true)
    end

  end

end

