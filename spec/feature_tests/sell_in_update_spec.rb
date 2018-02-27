require 'gilded_rose'

describe '#update_quality - updates the sell in date for item' do
  let(:items) { [Item.new('foo', 1, 1)] }
  let(:gilded_rose) { GildedRose.new(items) }

  it 'reduces an item sell_in attribute by one' do
    expect { gilded_rose.update_quality }.to change { items[0].sell_in }.by(-GildedRose::SELL_IN_CHANGE)
  end

  it 'allows an item sell_in date to go below zero' do
    2.times { gilded_rose.update_quality }
    expect(items[0].sell_in).to eq -1
  end
end
