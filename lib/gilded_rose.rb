class GildedRose
  require_relative 'item'
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  QUALITY_CHANGE = 1
  SELL_IN_CHANGE = 1

  def initialize(items)
    @items = items
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
      increase_quality(item)
    else
      decrease_quality(item)
    end
  end

  def increase_quality(item)
    increases_quality(item)
    update_pass_quality(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
    update_brie_quality(item) if item.name == 'Aged Brie'
  end

  def increases_quality(item)
    item.quality += QUALITY_CHANGE if quality_not_max(item)
  end

  def update_brie_quality(item)
    increases_quality(item) if passed_sell_by(item)
  end

  def update_pass_quality(item)
    increases_quality(item) if item.sell_in < BSP_LIMIT_1
    increases_quality(item) if item.sell_in < BSP_LIMIT_2
    item.quality = MIN_QUALITY if passed_sell_by(item)
  end

  def decrease_quality(item)
    decreases_quality(item) if passed_sell_by(item)
    decreases_quality(item)
  end

  def decreases_quality(item)
    item.quality -= QUALITY_CHANGE unless quality_at_min(item)
  end

  SELL_BY = 0
  BSP_LIMIT_1 = 10
  BSP_LIMIT_2 = 6
  NO_CHANGE_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze
  INCREASE_ITEMS = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert'].freeze

  def update_item_sell_in(item)
    item.sell_in -= SELL_IN_CHANGE
  end

  def passed_sell_by(item)
    item.sell_in < SELL_BY
  end

  def no_change_item(item)
    NO_CHANGE_ITEMS.include?(item.name)
  end

  def quality_at_min(item)
    item.quality <= MIN_QUALITY
  end

  def quality_not_max(item)
    item.quality < MAX_QUALITY
  end

  def increase_quality_item(item)
    INCREASE_ITEMS.include?(item.name)
  end

end
