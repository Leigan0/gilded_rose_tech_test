class GildedRose
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  QUALITY_CHANGE = 1
  SELL_IN_CHANGE = 1
  SELL_BY = 0
  BSP_LIMIT_1 = 10
  BSP_LIMIT_2 = 6


  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item_sell_in(item)

      if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
        if item.quality > MIN_QUALITY
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality = item.quality - QUALITY_CHANGE
          end
        end
      else
        if item.quality < MAX_QUALITY
          item.quality = item.quality + QUALITY_CHANGE
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < BSP_LIMIT_1
              item.quality = item.quality + QUALITY_CHANGE if item.quality < MAX_QUALITY
            end
            if item.sell_in < BSP_LIMIT_2
              item.quality = item.quality + QUALITY_CHANGE if item.quality < MAX_QUALITY
            end
          end
        end
      end
      if item.sell_in < SELL_BY
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > MIN_QUALITY
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - QUALITY_CHANGE
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          item.quality = item.quality + QUALITY_CHANGE if item.quality < MAX_QUALITY
        end
      end
    end
  end

  def update_item_sell_in(item)
    item.sell_in -= SELL_IN_CHANGE unless item.name == 'Sulfuras, Hand of Ragnaros'
  end
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
