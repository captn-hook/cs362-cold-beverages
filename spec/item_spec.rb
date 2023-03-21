require_relative '../lib/item'

describe 'An item of food or a beverage' do

    it 'has a name and volume' do
        item = Item.new('FAKE', 100)
        expect(item.name).to eq('FAKE')
        expect(item.volume).to eq(100)
    end

    it 'has a default name and volume' do
        item = Item.new
        expect(item.name).to eq('Mystery Treat')
        expect(item.volume).to eq(100)
        expect(item.age).to eq(0)
        expect(item.spoil).to eq(false)
    end

    it 'can be eaten' do
        item = Item.new('FAKE', 100)
        item.eat
        expect(item.volume).to eq(0)
    end

    it 'can be eaten in smaller amounts' do
        item = Item.new('FAKE', 100)
        item.eat(50)
        expect(item.volume).to eq(50)
    end

    it 'can get older' do
        item = Item.new('FAKE', 100)
        item.older
        expect(item.age).to eq(1)
    end

    it 'can be edible' do
        item = Item.new('FAKE', 100)
        expect(item.edible?).to eq(true)
    end

    it 'can kill you' do
        item = Item.new('FAKE', 100, 100, 100)
        expect(item.edible?).to eq(true)
    end
end
