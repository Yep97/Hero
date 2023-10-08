require_relative 'item'

class Potion < Item
  attr_reader :healing_value

  def post_initialize(opts)
    @healing_value = opts[:healing_value] || default_healing_value
  end

  def default_name
    'Potion'
  end

  def default_price
    30
  end

  def default_healing_value
    1
  end

  def self.increase_statistic(hero:, item:)
    hero.first.health += (hero.first.max_health * item.healing_value).round
    hero.first.health = hero.first.max_health if hero.first.health > hero.first.max_health
    hero.first.health
  end
end
