require_relative 'game'
require_relative './characters/hero'

hero = Hero.new

def start_game(hero:)
  Game.new(
    hero: hero
  ).start_game
end

start_game(hero: hero)
