require_relative '../lib/chiller'

describe 'A chiller' do

    it 'initializes' do
        chiller = Chiller.new
        expect(chiller).to be_a(Chiller)
    end

    it 'initializes with ...' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
        expect(chiller.temperature).to eq(70)
        expect(chiller.power).to eq(:off)
        expect(chiller.contents).to eq([])
    end

    it 'can be turned on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.power).to eq(:on)
    end

    it 'can be turned off' do
        chiller = Chiller.new
        chiller.turn_off
        expect(chiller.power).to eq(:off)
    end

    it 'can add an item' do
        chiller = Chiller.new
        item = Item.new
        chiller.add(item)
        expect(chiller.contents).to eq([item])
    end

    it 'can calculate remaining capacity' do
        chiller = Chiller.new
        item = Item.new('FAKE', 50)
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(50)
    end

    it 'can set the level' do
        chiller = Chiller.new
        chiller.set_level(1)
        expect(chiller.temperature).to eq(65)
    end

end
