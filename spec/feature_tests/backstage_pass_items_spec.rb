require 'gilded_rose'

describe '#update_quality - Backstage passes items' do
  let(:items) { [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, GildedRose::MIN_QUALITY), Item.new('Backstage passes to a TAFKAL80ETC concert', 9, (GildedRose::MAX_QUALITY - 2)), Item.new('Backstage passes to a TAFKAL80ETC concert', 1, GildedRose::MIN_QUALITY), Item.new('Backstage passes to a TAFKAL80ETC concert', 5, GildedRose::MAX_QUALITY - 3)] }
  let(:gilded_rose) { GildedRose.new(items) }

  context 'sell_in is greater than 10' do
    it 'increases in quality by one for each remaining sell by date' do
      expect { gilded_rose.update_quality }.to change { items[0].quality }.by(GildedRose::QUALITY_CHANGE)
    end
  end

  context 'sell_in is between 10 - 6' do
    it 'increases in quality by 2' do
      expect { gilded_rose.update_quality }.to change { items[1].quality }.by(GildedRose::QUALITY_CHANGE * 2)
    end

    it 'will not increase quality above 50' do
      2.times { gilded_rose.update_quality }
      expect(items[1].quality).to eq GildedRose::MAX_QUALITY
    end
  end

  context 'sell_in date is less than 5' do
    it 'increases in quality by 3' do
      expect { gilded_rose.update_quality }.to change { items[2].quality }.by(GildedRose::QUALITY_CHANGE * 3)
    end
    it 'will not increase quality above 50' do
      gilded_rose.update_quality
      gilded_rose.update_quality
      expect(items[3].quality).to eq GildedRose::MAX_QUALITY
    end
  end

  it 'reduces quality to MIN_QUALITY when sell_in < 0' do
    2.times { gilded_rose.update_quality }
    expect(items[2].quality).to eq GildedRose::MIN_QUALITY
  end
end
