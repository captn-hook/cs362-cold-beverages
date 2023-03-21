require_relative '../lib/refrigerator'

describe 'A refrigerator' do

    before (:each) do
        @chiller = Chiller.new
        @freezer = Freezer.new
        @water_reservoir = WaterReservoir.new
        @water_dispenser = WaterDispenser.new(@water_reservoir)
    end

    it 'initializes' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        expect(refrigerator).to be_a(Refrigerator)
    end

    it 'initializes with ...' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        expect(refrigerator.power).to eq(:off)
        expect(refrigerator.water_reservoir).to be_a(WaterReservoir)
        expect(refrigerator.water_dispenser).to be_a(WaterDispenser)
        expect(refrigerator.freezer).to be_a(Freezer)
        expect(refrigerator.chiller).to be_a(Chiller)
    end

    it 'can be turned on' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        refrigerator.plug_in
        expect(refrigerator.power).to eq(:on)
    end

    it 'can be turned off' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        refrigerator.unplug
        expect(refrigerator.power).to eq(:off)
    end

    it 'can add an item to the freezer' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        item = Item.new
        refrigerator.freeze(item)
        expect(refrigerator.freezer.contents).to eq([item])
    end

    it 'can add an item to the chiller' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        item = Item.new
        refrigerator.chill(item)
        expect(refrigerator.chiller.contents).to eq([item])
    end

    it 'can add water to the water reservoir' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        refrigerator.fill(10)
        expect(refrigerator.water_reservoir.empty?).to be false
    end

    it 'can dispense water' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        vessel = Vessel.new
        refrigerator.dispense(vessel)
        expect(refrigerator.water_reservoir).to be_empty
    end

    it 'can get capacity' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        expect(refrigerator.remaining_capacity).to eq(200)
    end

    it 'can get remaining capacity' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        item = Item.new('FAKE', 50)
        refrigerator.chill(item)
        expect(refrigerator.remaining_capacity).to eq(150)
    end

    it 'can set the chiller level' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        refrigerator.set_chiller_level(1)
        expect(refrigerator.chiller.temperature).to eq(65)
    end

    it 'can set the freezer level' do
        refrigerator = Refrigerator.new(@chiller, @freezer, @water_dispenser)
        refrigerator.set_freezer_level(1)
        expect(refrigerator.freezer.temperature).to eq(60)
    end

end
