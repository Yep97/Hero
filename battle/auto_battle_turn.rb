module AutoBattleTurn
  def self.do_turn(action_performers:, action_victims:)
    perform_attack(attackers: action_performers, victims: action_victims)
    return true if did_win_battle(winners: action_performers, losers: action_victims)
  end

  def self.perform_attack(attackers:, victims:)
    attackers.each { |attacker| attacker.attack(victims.first) }
    victims.first
  end

  private_class_method def self.did_win_battle(winners:, losers:)
    delete_dead(victims: losers)
    if losers.empty?
      print winners.first.win_shout
      true
    end
  end

  private_class_method def self.delete_dead(victims:)
    victims.delete_if do |victim|
      if victim.died?
        print victim.defeat_message
        true
      end
    end
  end
end
