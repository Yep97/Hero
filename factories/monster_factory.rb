require_relative 'factory'
require_relative '../characters/monster'

module MonsterFactory
  include Factory

  def self.create_more_monsters(type_of_monster: 'easy', number_of_monsters: 1)
    monsters = []
    number_of_monsters.times do |monster_index|
      monsters[monster_index] = monster_type(type_of_monster: type_of_monster)
    end
    monsters
  end

  def self.monster_type(type_of_monster:)
    case type_of_monster
    when 'easy'
      Monster.new(name: Factory.create_name(Monster.name_type), health: 75, min_dmg: 1, max_dmg: 5,
                  gold: Monster.calculate_loot(max_health: 75, damage_range: [1, 5]))
    when 'medium'
      Monster.new(name: Factory.create_name(Monster.name_type), health: 100, min_dmg: 1, max_dmg: 10,
                  gold: Monster.calculate_loot(max_health: 100, damage_range: [1, 10]))
    when 'hard'
      Monster.new(name: Factory.create_name(Monster.name_type), health: 150, min_dmg: 5, max_dmg: 15,
                  gold: Monster.calculate_loot(max_health: 150, damage_range: [5, 15]))
    end
  end
end
