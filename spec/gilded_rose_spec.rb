require 'gilded_rose'

describe GildedRose do
  let(:items) { [Item.new('foo', 5, 5)] }
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    it 'does not change the name' do
      gilded_rose.update_quality
      expect(items[0].name).to eq 'foo'
    end
    context 'items sell_in date' do
      context 'sell in date for Sulfuras items' do
        it 'does not change sell in date for Sulfuras items' do
          items = [Item.new('Sulfuras, Hand of Ragnaros', 5, 5)]
          gilded_rose = described_class.new(items)
          gilded_rose.update_quality
          expect(items[0].sell_in).to eq 5
        end
      end
      context 'all other items sell_in date' do
        it 'reduces an item sell_in attribute by one' do
          gilded_rose.update_quality
          expect(items[0].sell_in).to eq 4
        end
        it 'allows an item sell_in date to go below zero' do
          6.times { gilded_rose.update_quality }
          expect(items[0].sell_in).to eq -1
        end
      end
    end
  end
end
