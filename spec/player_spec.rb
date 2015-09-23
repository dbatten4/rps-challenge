require 'player'

describe Player do 

  it { is_expected.to respond_to(:choose_option).with(1).argument }
  it { is_expected.to respond_to(:generate_turn) }

  it 'should initialize with choice nil' do 
      expect(subject.choice).to eq(nil)
  end

  it 'should be able to choose an option' do 
    subject.choose_option(:rock)
    expect(subject.choice).to eq(:rock)
  end

  it 'should not be able to choose anything other than r, p or s' do 
    expect{ subject.choose_option(:football) }.to raise_error 'That is not a valid option'
  end

  it 'should generate a random turn and store it' do 
  subject.generate_turn
  expect(subject.options.include?(subject.choice)).to eq(true)
  end

end