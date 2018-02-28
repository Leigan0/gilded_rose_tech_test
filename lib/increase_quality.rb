
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

  def increases_quality
    @item.quality += QUALITY_CHANGE if quality_not_max
  end

  def update_brie_quality
    increases_quality if passed_sell_by
  end

  def update_pass_quality
    increases_quality if item.sell_in < BSP_LIMIT_1
    increases_quality if item.sell_in < BSP_LIMIT_2
    item.quality = MIN_QUALITY if passed_sell_by
  end

  private

  attr_reader :item
  def passed_sell_by
    item.sell_in < SELL_BY
  end

  def quality_not_max
    item.quality < MAX_QUALITY
  end

  BSP_LIMIT_1 = 10
  BSP_LIMIT_2 = 6
  MAX_QUALITY = 50
  SELL_BY = 0
  MIN_QUALITY = 0
  QUALITY_CHANGE = 1
end
