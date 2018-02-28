
class IncreaseQuality
  def initialize(item)
    @item = item
  end

  def increase_quality
    increases_quality
    update_pass_quality if item.name == 'Backstage passes to a TAFKAL80ETC concert'
    update_brie_quality if item.name == 'Aged Brie'
  end

  private
  attr_reader :item

  def increases_quality
    @item.quality += GildedRose::QUALITY_CHANGE if quality_not_max
  end

  def update_brie_quality
    increases_quality if passed_sell_by
  end

  def update_pass_quality
    increases_quality if item.sell_in < GildedRose::BSP_LIMIT_1
    increases_quality if item.sell_in < GildedRose::BSP_LIMIT_2
    item.quality = GildedRose::MIN_QUALITY if passed_sell_by
  end

  def passed_sell_by
    item.sell_in < GildedRose::SELL_BY
  end

  def quality_not_max
    item.quality < GildedRose::MAX_QUALITY
  end
end
