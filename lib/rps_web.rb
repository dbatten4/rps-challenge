require 'sinatra/base'
require_relative 'game'

class RPSWeb < Sinatra::Base

  $previous_result = :none
  enable :sessions
  
  get '/' do
    erb :index
  end

  get '/game' do 
    session[:name] = params[:name]
    @name = session[:name]
    erb :game
  end

  get '/result' do
    human = Human.new
    computer = Computer.new
    game = Game.new
    human.choose_option(params[:choice].to_sym)
    computer.generate_turn
    if game.human_winner?(human, computer)
      @message = "Congratulations, you have won. Computer chose #{computer.choice}" 
      $previous_result = :win
    end
    if game.human_loser?(human, computer)
      @message = "Commiserations, you have lost. Computer chose #{computer.choice}" 
      $previous_result = :loss
    end
    if game.draw?(human, computer)
      @message = "It's a draw. Computer also chose #{computer.choice}" 
      $previous_result = :draw
    end
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }

end