require_relative 'character'

class Hero < Character
  private

  HERO_NAME = 'Hero'.freeze
  HERO_MAX_HEALTH = 100
  HERO_HEALTH = 100
  HERO_MAX_DMG = 10
  HERO_MIN_DMG = 5
  HERO_DMG = [HERO_MIN_DMG, HERO_MAX_DMG].freeze
  HERO_GOLD = 0

  def default_name
    HERO_NAME
  end

  def default_max_health
    HERO_MAX_HEALTH
  end

  def default_health
    set_health(max_health: HERO_MAX_HEALTH, health: HERO_HEALTH)
  end

  def default_damage_range
    [HERO_MIN_DMG, HERO_MAX_DMG]
  end

  def default_gold
    HERO_GOLD
  end

  public

  def defeat_message
    "The hero has lost the battle!\n".red
  end

  def win_shout
    "The hero won the battle with #{return_remaining_health}".green
  end
end
