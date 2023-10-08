class Item
  attr_reader :name, :price

  def initialize(**opts)
    @name = opts[:name] || default_name
    @price = opts[:price] || default_price
    post_initialize(opts)
  end

  def post_initialize(opts); end

  def default_name
    'Item'
  end

  def default_price
    10
  end

  def to_s
    @name
  end

  def self.increse_statistic
    raise NotImplementedError
  end
end
