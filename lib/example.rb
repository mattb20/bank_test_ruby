class Animal
  attr_reader :legs
  def initialize(legs)
    @legs = legs
  end

  def update(legs)
    # complex stuff
    @legs = legs
  end
end

RSpec.describe Animal do
  it 'test' do
    animal = Animal.new

    expect(animal.update(8)).to eq(8)
  end

  it 'initializes with data' do
    animal = Animal.new(6)
    expect(animal.legs).to eq 6
  end
end
