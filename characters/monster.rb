require_relative 'character'
require 'random_name_generator'

class Monster < Character
  private

  MONSTER_NAME = 'Monster'.freeze
  MONSTER_NAME_TYPE = RandomNameGenerator::GOBLIN
  MONSTER_MAX_HEALTH = 100
  MONSTER_HEALTH = 100
  MONSTER_MAX_DMG = 10
  MONSTER_MIN_DMG = 1
  MONSTER_DMG = [MONSTER_MIN_DMG, MONSTER_MAX_DMG].freeze

  def default_name
    MONSTER_NAME
  end

  def default_max_health
    MONSTER_MAX_HEALTH
  end

  def default_health
    set_health(max_health: MONSTER_MAX_HEALTH, health: MONSTER_HEALTH)
  end

  def default_damage_range
    [MONSTER_MIN_DMG, MONSTER_MAX_DMG]
  end

  def default_gold
    calculate_loot(max_health: default_max_health, damage_range: default_damage_range)
  end

  public

  def self.calculate_loot(max_health: @max_health, damage_range: @damage_range)
    (20 + (max_health * 0.2 + damage_range[0] * 2 + damage_range[1] * 0.7).round)
  end

  def win_shout
    "Monster won with #{return_remaining_health}".red
  end

  def defeat_message
    "The hero has defeated #{name}!".killed_monster_text
  end

  def self.name_type
    MONSTER_NAME_TYPE
  end
end
