require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class RPSWeb < Sinatra::Base

  $previous_result = :none
  enable :sessions
  set :static, true
  set :root, File.dirname(__FILE__)

  get '/' do
    erb :index
  end

  post '/' do
    session[:name] = params[:name]
    redirect '/game'
  end

  get '/game' do 
    @name = session[:name]
    erb :game
  end

  get '/result' do
    human = Player.new
    computer = Player.new
    game = Game.new
    human.choose_option(params[:choice].to_sym)
    computer.generate_turn
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
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }

end
