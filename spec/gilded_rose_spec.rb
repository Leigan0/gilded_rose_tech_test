require 'gilded_rose'

describe GildedRose do
  let(:backstagepasses) { [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 1)] }
  let(:gilded_rose_pass) { described_class.new(backstagepasses)}

  let(:bries) { [Item.new('Aged Brie', 1, 46), Item.new('Aged Brie', -1, 46), Item.new('Aged Brie', -1, 50)] }
  let(:gilded_rose_brie) { described_class.new(bries) }

  let(:items) { [Item.new('foo', 1, 0), Item.new('Sulfuras, Hand of Ragnaros', 5, 5)] }
  let(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    before(:each) do
      gilded_rose.update_quality
    end
    it 'does not change the name' do
      expect(items[0].name).to eq 'foo'
    end
    describe 'items sell_in date' do
      context 'sell in date for Sulfuras items' do
        it 'does not change sell in date for Sulfuras items' do
          expect(items[1].sell_in).to eq 5
        end
      end
      context 'all other items sell_in date' do
        it 'reduces an item sell_in attribute by one' do
          expect(items[0].sell_in).to eq 0
        end
        it 'allows an item sell_in date to go below zero' do
          gilded_rose.update_quality
          expect(items[0].sell_in).to eq -1
        end
      end
    end

    describe 'item quality attribute' do
      it 'will not drop item quality be below 0' do
        expect(items[0].quality).to eq 0
      end

      context 'sell in date for Sulfuras items' do
        it 'will not alter the quality attribute for Sulfuras items' do
          expect(items[1].quality).to eq 5
        end
      end

      context 'Aged Brie items' do
        before(:each) do
          gilded_rose_brie.update_quality
        end
        it 'increases in quality by one for each remaining sell by date' do
          expect(bries[0].quality).to eq 47
        end
        it 'increases in quality twice as fast when Aged Brie sell_in < 0' do
          expect(bries[1].quality).to eq 48
        end
        it 'will not raise item quality above 50 theshold' do
          expect(bries[2].quality).to eq 50
        end
      end
    end
  end
end
