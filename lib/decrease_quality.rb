class DecreaseQuality
  def initialize(item)
    @item = item
  end

  def decrease_quality
    decreases_quality if passed_sell_by
    decreases_quality
    update_conjured_quality if item.name == 'Conjured'
  end

  private

  def update_conjured_quality
    decreases_quality if passed_sell_by
    decreases_quality
  end

  def decreases_quality
    @item.quality -= GildedRose::QUALITY_CHANGE unless quality_at_min
  end

  def passed_sell_by
    item.sell_in < GildedRose::SELL_BY
  end

  def quality_at_min
    item.quality <= GildedRose::MIN_QUALITY
  end

  attr_reader :item
end
