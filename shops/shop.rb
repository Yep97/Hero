class Shop
  def self.buy(hero:, price:)
    if hero.first.gold >= price
      hero.first.gold -= price
    else
      false
    end
  end

  def self.choose_item(items:, name:)
    items.select { |item| item.to_s == name }.first
  end

  def self.return_items
    raise NotImplementedError
  end

  def self.item_class
    raise NotImplementedError
  end

  def self.banner_text
    "\u{1F528} {{bold:Shop}} \u{1F528}"
  end

  def self.banner_color
    :green
  end

  def self.welcome_message
    'Welcome to Shop'
  end

  def self.buy_item(hero:, item_name:)
    raise NotImplementedError
  end
end
