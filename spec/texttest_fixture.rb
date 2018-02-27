require './lib/gilded_rose'

puts "OMGHAI!"
items = [
  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=50),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=50),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

days = 7
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end

# OMGHAI!
# -------- day 0 --------
# name, sellIn, quality
# +5 Dexterity Vest, 10, 20
# Aged Brie, 2, 0
# Elixir of the Mongoose, 5, 7
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 15, 20
# Backstage passes to a TAFKAL80ETC concert, 10, 49
# Backstage passes to a TAFKAL80ETC concert, 5, 49


# -------- day 1 --------
# name, sellIn, quality
# +5 Dexterity Vest, 9, 19
# Aged Brie, 1, 1
# Elixir of the Mongoose, 4, 6
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 14, 21
# Backstage passes to a TAFKAL80ETC concert, 9, 50
# Backstage passes to a TAFKAL80ETC concert, 4, 50
#
#
# -------- day 2 --------
# name, sellIn, quality
# +5 Dexterity Vest, 8, 18
# Aged Brie, 0, 2
# Elixir of the Mongoose, 3, 5
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 13, 22
# Backstage passes to a TAFKAL80ETC concert, 8, 50
# Backstage passes to a TAFKAL80ETC concert, 3, 50


# -------- day 3 --------
# name, sellIn, quality
# +5 Dexterity Vest, 7, 17
# Aged Brie, -1, 4
# Elixir of the Mongoose, 2, 4
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 12, 23
# Backstage passes to a TAFKAL80ETC concert, 7, 50
# Backstage passes to a TAFKAL80ETC concert, 2, 50
# Conjured Mana Cake, 0, 3
#
# -------- day 4 --------
# name, sellIn, quality
# +5 Dexterity Vest, 6, 16
# Aged Brie, -2, 6
# Elixir of the Mongoose, 1, 3
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 11, 24
# Backstage passes to a TAFKAL80ETC concert, 6, 50
# Backstage passes to a TAFKAL80ETC concert, 1, 50


# -------- day 5 --------
# name, sellIn, quality
# +5 Dexterity Vest, 5, 15
# Aged Brie, -3, 8
# Elixir of the Mongoose, 0, 2
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 10, 25
# Backstage passes to a TAFKAL80ETC concert, 5, 50
# Backstage passes to a TAFKAL80ETC concert, 0, 50


# -------- day 6 --------
# name, sellIn, quality
# +5 Dexterity Vest, 4, 14
# Aged Brie, -4, 10
# Elixir of the Mongoose, -1, 0
# Sulfuras, Hand of Ragnaros, 0, 50
# Sulfuras, Hand of Ragnaros, -1, 50
# Backstage passes to a TAFKAL80ETC concert, 9, 27
# Backstage passes to a TAFKAL80ETC concert, 4, 50
# Backstage passes to a TAFKAL80ETC concert, -1, 0
