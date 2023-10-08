require_relative 'shop'
require_relative '../items/weapon'
require_relative '../ui/string'

class WeaponsShop < Shop
  WEAPONS = [Weapon.new(name: 'Club', price: 50, damage_range: [4, 8]),
             Weapon.new(name: 'Sword', price: 100, damage_range: [10, 16])].freeze

  def self.return_items
    WEAPONS
  end

  def self.item_class
    Weapon
  end

  def self.banner_text
    "\u{1F528} {{bold:Weapons Shop}} \u{1F528}"
  end

  def self.banner_color
    :blue
  end

  def self.welcome_message
    'Welcome to Weapons Shop'
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
