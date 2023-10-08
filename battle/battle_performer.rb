require_relative 'auto_battle_turn'

module BattlePerformer
  include AutoBattleTurn

  def self.perform_battle(hero:, monsters:, auto_battle:)
    while battle_still_going_on?(attackers: hero, opponents: monsters)
      if auto_battle
        break if perform_auto_battle(hero: hero, monsters: monsters)
      elsif perform_static_battle(hero: hero, monsters: monsters)
        break
      end
    end
  end

  def self.perform_static_battle(hero:)
    raise NotImplementedError
  end

  def self.perform_auto_battle(hero:, monsters:)
    return true if AutoBattleTurn.do_turn(action_performers: hero, action_victims: monsters)
    return true if AutoBattleTurn.do_turn(action_performers: monsters, action_victims: hero)
  end

  def self.battle_still_going_on?(attackers:, opponents:)
    are_opponents_alive = []
    opponents.each_with_index do |opponent, opponent_index|
      are_opponents_alive[opponent_index] = !opponent.died?
    end
    !attackers.first.died? and !are_opponents_alive.empty?
  end
end
