class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def monster_name_text
    "\u{1f47e} \e[31m#{self}\e[0m \u{1f47e}"
  end

  def killed_monster_text
    "\u{2620} #{self} \u{2620}\n"
  end

  # def yellow
  #   colorize(33)
  # end

  # def blue
  #   colorize(34)
  # end

  # def pink
  #   colorize(35)
  # end

  # def light_blue
  #   colorize(36)
  # end
end
