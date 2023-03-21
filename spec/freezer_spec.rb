require_relative '../lib/freezer'

describe 'A freezer' do

    it 'initializes' do
        freezer = Freezer.new
        expect(freezer).to be_a(Freezer)
    end

    it 'initializes with ...' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
        expect(freezer.temperature).to eq(70)
        expect(freezer.power).to eq(:off)
        expect(freezer.contents).to eq([])
    end

    it 'can be turned on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.power).to eq(:on)
    end

    it 'can be turned off' do
        freezer = Freezer.new
        freezer.turn_off
        expect(freezer.power).to eq(:off)
    end

    it 'can add an item' do
        freezer = Freezer.new
        item = Item.new
        freezer.add(item)
        expect(freezer.contents).to eq([item])
    end

    it 'can calculate remaining capacity' do
        freezer = Freezer.new
        item = Item.new('FAKE', 50)
        freezer.add(item)
        expect(freezer.remaining_capacity).to eq(50)
    end

    it 'can set the level' do
        freezer = Freezer.new
        freezer.set_level(1)
        expect(freezer.temperature).to eq(60)
    end
end
