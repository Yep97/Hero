require_relative './ui/menu'
require 'cli/ui'

class Game
  private

  attr_reader :hero

  public

  include Menu

  def initialize(hero:)
    @hero = hero
  end

  def start_game
    Menu.start_menu(hero: [*hero])
  end
end
