require 'human'

RSpec.describe Human do
  let(:person) { Human.new('Sam')}
  let(:grid) { person.grid }

  it 'has a name' do
    expect(person.name).to eq('Sam')  
  end

  it 'has an own grid' do
    expect(grid).to be_a(Grid)  
  end

  it 'has has ten ships' do 
    expect(person.ships_collection.size).to eq(10) 
  end
end