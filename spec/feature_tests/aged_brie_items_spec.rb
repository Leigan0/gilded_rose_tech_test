require 'gilded_rose'

describe '#update_quality - Aged Brie items' do
  let(:items) { [Item.new('Aged Brie', 1, GildedRose::MIN_QUALITY), Item.new('Aged Brie', -1, GildedRose::MIN_QUALITY), Item.new('Aged Brie', -1, GildedRose::MAX_QUALITY)] }
  let(:gilded_rose) { GildedRose.new(items) }

  it 'increases in quality by quality change' do
    expect { gilded_rose.update_quality }.to change { items[0].quality }.by(GildedRose::QUALITY_CHANGE)
  end

  context 'when sell_in is < 0' do
    it 'increases in quality twice' do
      expect { gilded_rose.update_quality }.to change { items[1].quality }.by(GildedRose::QUALITY_CHANGE * 2)
    end
    it 'will not raise item quality above MAX_QUALITY theshold' do
      expect { gilded_rose.update_quality }.not_to change { items[2].quality }
    end
  end
end
