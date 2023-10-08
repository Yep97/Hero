class Character
  attr_accessor :max_health, :health, :gold, :min_dmg, :max_dmg

  private

  attr_reader :name

  MIN = 0
  MAX = 1

  def initialize(**opts)
    @max_health = opts[:max_health] || default_max_health
    @health = opts[:health] || default_health
    @min_dmg = opts[:min_dmg] || default_damage_range[MIN]
    @max_dmg = opts[:max_dmg] || default_damage_range[MAX]
    @name = opts[:name] || default_name
    @gold = opts[:gold] || default_gold
  end

  # opts[:damage_range[MIN]]
  # opts[:damage_range[MAX]]

  def default_max_health
    100
  end

  def default_health
    100
  end

  def default_damage_range
    [1, 10]
  end

  def default_name
    'NPC'
  end

  def default_gold
    0
  end

  def set_health(max_health: default_max_health, health: default_health)
    if health < max_health
      health
    else
      max_health
    end
  end

  public

  def to_s
    @name
  end

  def statistics
    [@name, @health, @min_dmg, @max_dmg, @gold]
  end

  def died?
    health <= 0
  end

  def attack(target)
    target.health -= rand(min_dmg..max_dmg)
  end

  def return_remaining_health
    "#{health} health remaining!"
  end

  def defeat_message
    raise NotImplementedError
  end

  def win_shout
    raise NotImplementedError
  end
end
