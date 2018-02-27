require 'gilded_rose'

describe GildedRose do
  let(:brie) { [Item.new('Aged Brie', 1, 46)] }
  let(:gilded_rose_brie) { described_class.new(brie) }
  let(:items) { [Item.new('foo', 5, 0)] }
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    it 'does not change the name' do
      gilded_rose.update_quality
      expect(items[0].name).to eq 'foo'
    end
    describe 'items sell_in date' do
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

    describe 'item quality attribute' do
      it 'will not drop item quality be below 0' do
        gilded_rose.update_quality
        expect(items[0].quality).to eq 0
      end
      context 'Aged Brie items' do
        it 'increases in quality by one for each remaining sell by date' do
          gilded_rose_brie.update_quality
          expect(brie[0].quality).to eq 47
        end
        it 'increases in quality twice as fast when Aged Brie sell_in < 0' do
          2.times { gilded_rose_brie.update_quality }
          expect(brie[0].quality).to eq 49
        end
        it 'will not raise item quality above 50 theshold' do
          3.times { gilded_rose_brie.update_quality }
          expect(brie[0].quality).to eq 50
        end
      end
    end
  end
end
