require_relative 'item'

class Weapon < Item
  attr_reader :min_dmg, :max_dmg

  MIN = 0
  MAX = 1

  def post_initialize(opts)
    @min_dmg = opts[:damage_range[MIN]] || default_damage_range[MIN]
    @max_dmg = opts[:damage_range[MAX]] || default_damage_range[MAX]
  end

  def default_name
    'Weapon'
  end

  def default_price
    30
  end

  def default_damage_range
    [1, 5]
  end

  def self.increase_statistic(hero:, item:)
    hero.first.min_dmg += item.min_dmg
    hero.first.max_dmg += item.max_dmg
    [hero.first.min_dmg, hero.first.max_dmg]
  end
end
