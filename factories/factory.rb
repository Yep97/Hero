require 'random_name_generator'

module Factory
  MIN_NUMBER_OF_SYLLABLES = 2
  MAX_NUMBER_OF_SYLLABLES = 6

  def self.create_name(name_type)
    number_of_syllables = rand(MIN_NUMBER_OF_SYLLABLES..MAX_NUMBER_OF_SYLLABLES)
    generated_name = RandomNameGenerator.new(name_type)
    generated_name.compose(number_of_syllables)
  end
end
