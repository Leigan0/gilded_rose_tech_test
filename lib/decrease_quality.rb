class DecreaseQuality
  def initialize(item)
    @item = item
  end

  def decrease_quality
    decreases_quality if passed_sell_by
    decreases_quality
  end

  private

  def decreases_quality
    @item.quality -= QUALITY_CHANGE unless quality_at_min
  end

  def passed_sell_by
    item.sell_in < SELL_BY
  end

  def quality_at_min
    item.quality <= MIN_QUALITY
  end

  attr_reader :item

  MIN_QUALITY = 0
  QUALITY_CHANGE = 1
  SELL_BY = 0
  MIN_QUALITY = 0
end
