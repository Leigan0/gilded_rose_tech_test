require 'gilded_rose'

describe GildedRose do
  let(:decreaseinstance) { double :decreaseinstance, decrease_quality: nil }
  let(:increaseinstance) { double :increaseinstance, increase_quality: nil }
  let(:increaseclass) { double :increase_class, new: increaseinstance }
  let(:decreaseclass) { double :decrease_class, new: decreaseinstance }

  it 'creates a new IncreaseQuality object when item is quality increasing' do
    item = double('item', :name => 'Aged Brie', :sell_in= => 9, :sell_in => 10, :quality => 0)
    gilded_rose = GildedRose.new(increaseclass, decreaseclass, [item])
    gilded_rose.update_quality
    expect(increaseclass).to have_received(:new)
  end

  it 'calls #increase_quality on new object created' do
    item = double('item', :name => 'Aged Brie', :sell_in= => 9, :sell_in => 10, :quality => 0)
    gilded_rose = GildedRose.new(increaseclass, decreaseclass, [item])
    gilded_rose.update_quality
    expect(increaseinstance).to have_received(:increase_quality)
  end

  it 'creates a new IncreaseQuality object when item is quality increasing' do
    item = double('item', :name => 'Peas', :sell_in= => 9, :sell_in => 10, :quality => 0)
    gilded_rose = GildedRose.new(increaseclass, decreaseclass, [item])
    gilded_rose.update_quality
    expect(decreaseclass).to have_received(:new)
  end

  it 'calls #decrease_quality on new object created' do
    item = double('item', :name => 'Peas', :sell_in= => 9, :sell_in => 10, :quality => 0)
    gilded_rose = GildedRose.new(increaseclass, decreaseclass, [item])
    gilded_rose.update_quality
    expect(decreaseinstance).to have_received(:decrease_quality)
  end
end
