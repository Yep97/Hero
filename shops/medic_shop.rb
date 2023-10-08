require_relative 'shop'
require_relative '../items/potion'
require_relative '../ui/string'

class MedicShop
  POTIONS = [Potion.new(name: 'Lesser healing potion', price: 5, healing_value: 0.1),
             Potion.new(name: 'Medium healing potion', price: 20, healing_value: 0.5),
             Potion.new(name: 'Greater healing potion', price: 35, healing_value: 1)].freeze

  def self.return_items
    POTIONS
  end

  def self.item_class
    Potion
  end

  def self.banner_text
    "\u{1F489} {{bold:Medic Shop}} \u{1F489}"
  end

  def self.banner_color
    :cyan
  end

  def self.welcome_message
    'Welcome to Medic Shop'
  end

  def self.buy_item(hero:, item_name:)
    item = Shop.choose_item(items: return_items, name: item_name)
    if Shop.buy(hero: hero, price: item.price)
      item_class.increase_statistic(hero: hero, item: item)
    else
      puts 'You don\'t have enough money to buy this item'.red
      false
    end
  end
end
