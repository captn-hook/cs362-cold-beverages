require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

    it 'has a reservoir' do
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        expect(dispenser.reservoir).to eq(reservoir)
    end

    it 'can dispense water' do
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        vessel = Vessel.new
        dispenser.dispense(vessel)
        expect(reservoir).to be_empty
    end

end