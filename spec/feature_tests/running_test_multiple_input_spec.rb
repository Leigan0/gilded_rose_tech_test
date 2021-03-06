require 'gilded_rose'
describe '#update_quality - updates quality for each item' do
  items = [
    Item.new('5 Dexterity Vest', 10, 20),
    Item.new('Aged Brie', 2, 0),
    Item.new('Elixir of the Mongoose', 5, 7),
    Item.new('Sulfuras, Hand of Ragnaros', 0, 50),
    Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
    Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
    Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)
  ]
  gilded_rose = GildedRose.new(items)

  it 'updates quality day six' do
    6.times { gilded_rose.update_quality }
    string = ''
    items.each do |item|
      string << "#{item.name} "
      string << "#{item.sell_in} "
      string << "#{item.quality} "
    end
    expect(string).to eq '5 Dexterity Vest 4 14 Aged Brie -4 10 Elixir of the Mongoose -1 0 Sulfuras, Hand of Ragnaros 0 50 Backstage passes to a TAFKAL80ETC concert 9 27 Backstage passes to a TAFKAL80ETC concert 4 50 Backstage passes to a TAFKAL80ETC concert -1 0 '
  end
end
