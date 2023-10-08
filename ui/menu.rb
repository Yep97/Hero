require_relative '../shops/weapons_shop'
require_relative '../shops/medic_shop'
require_relative '../battle/battle'

module Menu
  def self.start_menu(hero:)
    CLI::UI::StdoutRouter.enable
    CLI::UI::Frame.open("\u{1F37B} {{bold:Tavern}} \u{1F37B}", color: :magenta) do
      tavern_menu_options(hero: hero)
    end
  end

  def self.tavern_menu_options(hero:)
    hero_died_message if hero.empty?
    CLI::UI::Prompt.ask('Welcome great adventurer, what do you want to do?') do |handler|
      handler.option('Go to battle') { battle_menu(hero: hero) }
      handler.option('Go to medic shop') { shop_menu(hero: hero, shop: MedicShop) }
      handler.option('Go to weapons shop') { shop_menu(hero: hero, shop: WeaponsShop) }
      handler.option('Show statistics') { show_statistics(hero: hero) }
      handler.option('Quit the game') { |selection| selection }
    end
  end

  def self.battle_menu(hero:)
    CLI::UI::Frame.open("\u{1F525} {{bold:Battle}} \u{1F525}", color: :red) do
      CLI::UI::Prompt.ask('Choose battle type') do |handler|
        Battle.return_battle_types.each do |type|
          handler.option(type.capitalize) { Battle.new(type_of_monster: type).do_battle(hero: hero) }
        end
        handler.option('Return to tavern') { |section| section }
      end
    end
    return_to_tavern(hero: hero)
  end

  def self.shop_menu(hero:, shop:)
    CLI::UI::Frame.open(shop.banner_text, color: shop.banner_color) do
      CLI::UI::Prompt.ask(shop.welcome_message) do |handler|
        shop.return_items.each do |item|
          handler.option("#{item} - #{item.price}G") { shop.buy_item(hero: hero, item_name: item.to_s) }
        end
        handler.option('Return to tavern') { |section| section }
      end
    end
    return_to_tavern(hero: hero)
  end

  def self.show_statistics(hero:)
    CLI::UI::Frame.open('{{*}} {{bold:Statistics}} {{*}}', color: :green) do
      statistics = ['Name', 'Health', 'Min. attack', 'Max. attack', 'Gold']
      statistics.each_with_index { |stats, index| puts "#{stats}: #{hero.first.statistics[index]} \n" }
    end
    return_to_tavern(hero: hero)
  end

  def self.hero_died_message
    CLI::UI::Frame.open("\u{1F480} {{bold:Grave}} \u{1F480}", color: :red) do
      puts '   __     ______  _    _   _____ _____ ______ _____   '
      puts '   \ \   / / __ \| |  | | |  __ \_   _|  ____|  __ \  '
      puts '    \ \_/ / |  | | |  | | | |  | || | | |__  | |  | | '
      puts '     \   /| |  | | |  | | | |  | || | |  __| | |  | | '
      puts '      | | | |__| | |__| | | |__| || |_| |____| |__| | '
      puts '      |_|  \____/ \____/  |_____/_____|______|_____/  '
      puts ''
    end
    exit 0
  end

  def self.return_to_tavern(hero:)
    print "\n"
    CLI::UI::Frame.divider("\u{1F37B} {{bold:Tavern}} \u{1F37B}", color: :magenta)
    tavern_menu_options(hero: hero)
  end
end
