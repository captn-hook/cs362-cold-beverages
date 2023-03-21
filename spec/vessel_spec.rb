require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do

  it 'has a name and volume' do
    vessel = Vessel.new('FAKE')
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
  end

  it 'is initially empty' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel).to be_empty
  end

  it 'is no longer empty when we fill it' do
    vessel = Vessel.new
    vessel.fill
    expect(vessel).to_not be_empty
  end

  context 'with an item' do
     
    before do
      #fake item with volume 100 and volume method, named fake
      @item = Item.new('FAKE', 100)
      # @item = {name: 'FAKE', volume: 100}
      # allow(@item).to receive(:volume).and_return(100)
      # allow(@item).to receive(:class).and_return(Item)
    end

    it 'basically' do
      vessel = Vessel.new('FAKE', 100)
      expect(vessel._recieve(@item)).to eq(100)
    end

    it 'completely' do
      vessel = Vessel.new
      vessel.fill(@item)
      expect(vessel.item).to eq(@item)
    end
  end
end
