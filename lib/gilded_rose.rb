class GildedRose
  require_relative 'item'
  require_relative 'increase_quality'
  require_relative 'decrease_quality'

  SELL_IN_CHANGE = 1
  MIN_QUALITY = 0
  QUALITY_CHANGE = 1
  SELL_BY = 0
  BSP_LIMIT_1 = 10
  BSP_LIMIT_2 = 6
  MAX_QUALITY = 50
  SELL_BY = 0
  QUALITY_CHANGE = 1

  def initialize(increaseclass = IncreaseQuality, decreaseclass = DecreaseQuality, items)
    @items = items
    @increaseclass = increaseclass
    @decreaseclass = decreaseclass
  end

  def update_quality
    @items.each do |item|
      unless no_change_item(item)
        update_item_sell_in(item)
        update_item_quality(item)
      end
    end
  end

  private

  def update_item_quality(item)
    if increase_quality_item(item)
      @increaseclass.new(item).increase_quality
    else
      @decreaseclass.new(item).decrease_quality
    end
  end

  NO_CHANGE_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze
  INCREASE_ITEMS = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert'].freeze

  def update_item_sell_in(item)
    item.sell_in -= SELL_IN_CHANGE
  end

  def no_change_item(item)
    NO_CHANGE_ITEMS.include?(item.name)
  end

  def increase_quality_item(item)
    INCREASE_ITEMS.include?(item.name)
  end
end
