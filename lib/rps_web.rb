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
    @message2 = 'Pick another move'
    if $previous_result == :none
      @message1 = 'Hello'
      @message2 = 'Pick your move'
    elsif $previous_result == :win
      @message1 = ['You\'re awesome', 'Way to go', 'Nice one', 'Great stuff', 'You\'re a natural', 'You\'re making it look easy'].sample
    elsif $previous_result == :loss
      @message1 = ['Unlucky', 'Stiff upper lip', 'Roll with the punches', 'It\'s a game of chance', 'It\'s a game of two halves', 'Stay strong'].sample
    elsif $previous_result == :draw
      @message1 = ['At least you didn\'t lose', 'So close', 'These things happen', 'You can do this', 'Almost had him', 'Keep your focus'].sample
    end
    @name = session[:name]
    erb :game
  end

  get '/result' do
    human = Player.new
    computer = Player.new
    game = Game.new
    human.choose_option(params[:choice].to_sym)
    computer.generate_turn
    game.play_game(human, computer)
    @message1 = game.message1
    @message2 = game.message2
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }

end
