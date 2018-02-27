require 'gilded_rose'

describe '#update_quality - item quality attribute standard(non rule items)' do
  let(:items) { [Item.new('foo', 1, 1), Item.new('foo', 0, 2)] }
  let(:gilded_rose) { GildedRose.new(items) }

  it 'reduces quality of items by quality change when sellby date > 0' do
    expect { gilded_rose.update_quality }.to change { items[0].quality }.by(-GildedRose::QUALITY_CHANGE)
  end
  it 'reduces quality of items by 2 quality changes when sellby date < 0' do
    expect { gilded_rose.update_quality }.to change { items[1].quality }.by(-(GildedRose::QUALITY_CHANGE * 2))
  end
  it 'will not drop item quality be below MIN_QUALITY' do
    2.times { gilded_rose.update_quality }
    expect(items[0].quality).to eq GildedRose::MIN_QUALITY
  end
end
