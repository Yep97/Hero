require_relative '../ui/string'
require_relative '../factories/monster_factory'
require_relative 'battle_performer'

class Battle
  private

  include BattlePerformer

  MIN_NUMBER_OF_MONSTERS = 1
  MAX_NUMBER_OF_MONSTERS = 2
  MONSTER_TYPES = %w[easy medium hard].freeze
  AUTO_BATTLE = true

  def initialize(**opts)
    @number_of_monsters = opts[:number_of_monsters] || default_number_of_monsters
    @type_of_monster = opts[:type_of_monster] || default_type_of_monster
    @auto_battle = opts[:auto_battle] || default_auto_battle
    @monsters = MonsterFactory.create_more_monsters(type_of_monster: @type_of_monster,
                                                    number_of_monsters: @number_of_monsters)
  end

  def default_number_of_monsters
    rand(MIN_NUMBER_OF_MONSTERS..MAX_NUMBER_OF_MONSTERS)
  end

  def default_type_of_monster
    MONSTER_TYPES[0]
  end

  def default_auto_battle
    AUTO_BATTLE
  end

  public

  def do_battle(hero:)
    loot = sum_possible_loot(victims: @monsters)
    print_starting_message(attackers: hero, opponents: @monsters)
    BattlePerformer.perform_battle(hero: hero, monsters: @monsters, auto_battle: @auto_battle)
    battle_result(attackers: hero, opponents: @monsters, loot: loot)
  end

  def sum_possible_loot(victims:)
    loot = 0
    victims.each { |victim| loot += victim.gold }
    loot
  end

  def print_starting_message(attackers:, opponents:)
    message = "The #{attackers.first.to_s.green} is fighting "
    message += if opponents.length > 1
                 "enemies:\n"
               else
                 'enemy '
               end
    opponents.each { |opponent| message += "#{opponent.to_s.monster_name_text}\n" }
    print message
    message
  end

  def set_loot(attackers:, loot:)
    attackers.first.gold += loot
  end

  def self.return_battle_types
    MONSTER_TYPES
  end

  private

  def battle_result(attackers:, opponents:, loot: 0)
    if opponents.empty?
      set_loot(attackers: attackers, loot: loot)
      'Hero won'
    else
      'Monsters won'
    end
  end
end
