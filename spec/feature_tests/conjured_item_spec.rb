require 'gilded_rose'

describe '#update_quality - Conjured items' do
  let(:items) { [Item.new('Conjured', 1, 5)] }
  let(:gilded_rose) { GildedRose.new(items) }

  it 'reduces quality twice as fast as normal items' do
    expect { gilded_rose.update_quality }.to change { items[0].quality }.by(- GildedRose::QUALITY_CHANGE * 2)
  end
end
