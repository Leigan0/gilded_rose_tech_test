require 'gilded_rose'

describe '#update_quality - for Sulfuras items' do
  let(:items) { [Item.new('Sulfuras, Hand of Ragnaros', 5, 5)] }
  let(:gilded_rose) { GildedRose.new(items) }

  it 'will not alter the quality attribute for Sulfuras items' do
    expect(items[0].quality).to eq 5
  end

  it 'does not change sell in date for Sulfuras items' do
    expect { gilded_rose.update_quality }.to_not change { items[0].sell_in }
  end
end
