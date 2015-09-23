class Player 

  attr_reader :choice, :options

  def initialize
    @options = [:rock, :paper, :scissors]
    @choice = nil
  end

  def choose_option(option)
    fail 'That is not a valid option' unless options.include? option
    @choice = option
  end

  def generate_turn
    @choice = options.sample
  end

end